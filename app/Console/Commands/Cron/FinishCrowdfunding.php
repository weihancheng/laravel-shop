<?php

namespace App\Console\Commands\Cron;

use App\Jobs\RefundCrowdfundingOrders;
use App\Models\CrowdfundingProduct;
use Carbon\Carbon;
use Illuminate\Console\Command;

class FinishCrowdfunding extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:finish-crowdfunding';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '结束众筹';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        CrowdfundingProduct::query()
            ->where('end_at', '<=', Carbon::now())
            ->where('status', CrowdfundingProduct::STATUS_FUNDING)
            ->get()
            ->each(function (CrowdfundingProduct $crowdfunding) {
                // 如果众筹目标金额大于实际众筹实际金额
                if ($crowdfunding->target_amount > $crowdfunding->total_amount) {
                    // 众筹失败逻辑
                    $this->crowdfundingFailed($crowdfunding);
                } else {
                    // 众筹成功逻辑
                    $this->crowdfundingSucceed($crowdfunding);
                }
            });
    }

    // 众筹成功逻辑
    protected function crowdfundingSucceed(CrowdfundingProduct $crowdfundingProduct)
    {
        // 只需要将众筹状态改为众筹成功即可
        $crowdfundingProduct->update([
            'status' => CrowdfundingProduct::STATUS_SUCCESS
        ]);
    }

    // 众筹失败逻辑
    protected function crowdfundingFailed(CrowdfundingProduct $crowdfundingProduct)
    {
        $crowdfundingProduct->update([
            'status' => CrowdfundingProduct::STATUS_FUNDING
        ]);

        dispatch(new RefundCrowdfundingOrders());
    }
}
