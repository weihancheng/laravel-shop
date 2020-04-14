<?php

namespace App\Console\Commands\Cron;

use App\Models\Installment;
use App\Models\InstallmentItem;
use Carbon\Carbon;
use Illuminate\Console\Command;

class CalculateInstallmentFine extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:calculate-installment-fine';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '计算分期付款逾期费';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        InstallmentItem::query()->with(['installment'])
            ->whereHas('installment', function ($query) {
                // 获取状态为还款中
                $query->where('status', Installment::STATUS_REPAYING);
            })
            ->where('due_date', '<=', Carbon::now())
            ->whereNull('paid_at')
            ->chunkById(1000, function ($items) {
                foreach ($items as $item) {
                    // 通过Carbon对象的diffInDays直接得到逾期天数
                    $overdueDays = Carbon::now()->diffInDays($items->due_date);
                    // 本金和手续费之和
                    $base = big_number($item->base)->add($item->fee)->getValue();
                    // 计算逾期费
                    $fine = big_number($base)->multiply($overdueDays)
                        ->multiply($item->installment->fine_rate)
                        ->divide(100)
                        ->getValue();  // 高精度计算 先乘绝对值大的数或先除绝对值小的数。
                    // 避免逾期费高于本金与手续费之和, 使用compareTo方法来判断
                    // 如果$fine 大于 $base, 则compareTo 返回 1, 相等0, 小于-1
                    $fine = big_number($fine)->compareTo($base) === 1 ? $base : $fine;
                    $item->update([
                        'fine' => $fine
                    ]);
                }
            });
    }
}
