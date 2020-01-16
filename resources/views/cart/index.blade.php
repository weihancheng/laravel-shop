@extends('layouts.app')
@section('title', '购物车')

@section('content')
    <div class="row">
        <div class="col-lg-10 offset-lg-1">
            <div class="card">
                <div class="card-header">我的购物车</div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="select-all"></th>
                            <th>商品信息</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody class="product_list">
                        @foreach($cartItems as $item)
                            <tr data-id="{{ $item->productSku->id }}">
                                <td>
                                    <input type="checkbox" name="select" value="{{ $item->productSku->id }}"
                                            {{ $item->productSku->product->on_sale ? 'checked' : 'disabled' }}>
                                </td>
                                <td class="product_info">
                                    <div class="preview">
                                        <a href="{{ route('products.show', ['product' => $item->productSku->product_id]) }}" target="_blank">
                                            <img src="{{ $item->productSku->product->image_url }}" alt="">
                                        </a>
                                    </div>
                                    <div @if(!$item->productSku->product->on_sale) class="not_on_sale" @endif>
                                        <span class="product_title">
                                            <a target="_blank" href="{{ route('products.show', ['product' => $item->productSku->product_id]) }}">
                                                {{ $item->productSku->product->title }}
                                            </a>
                                        </span>
                                        <span class="sku_title">{{ $item->productSku->title }}</span>
                                        @if(!$item->productSku->product->on_sale)
                                            <span class="warning">该商品已下架</span>
                                        @endif
                                    </div>
                                </td>
                                <td>
                                    <span class="price">￥{{ $item->productSku->price }}</span>
                                </td>
                                <td>
                                    <input type="text" class="form-control form-control-sm amount" name="amount" value="{{$item->amount}}"
                                           @if(!$item->productSku->product->on_sale) disabled @endif>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-danger btn-remove">移除</button>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{-- 收货地址start --}}
                    <div>
                        <form class="form-horizontal" role="form" id="order-form">
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3 text-md-right">选择收货地址</label>
                                <div class="col-sm-9 col-md-7">
                                    <select class="form-control" name="address">
                                        @foreach($addresses as $address)
                                            <option value="{{ $address->id }}">{{ $address->full_address }} {{ $address->contact_name }} {{ $address->contact_phone }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-sm-3 text-md-right">备注</label>
                                <div class="col-sm-9 col-md-7">
                                    <textarea name="remark" class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="offset-sm-3 col-sm-3">
                                    <button type="button" class="btn btn-primary btn-create-order">提交订单</button>
                                </div>
                            </div>
                        </form>
                        </form>
                    </div>
                    {{-- 收货地址end --}}
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scriptsAfterJs')
    <script>
        $(document).ready(function() {
            // 移除按钮
            $('.btn-remove').click(function() {
                var id = $(this).closest('tr').data('id');
                swal({
                    title: "确定要将该商品移除吗?",
                    icon: "warning",
                    buttons: ['取消', '确定'],
                    dangerMode: true,
                }).then(function(willDelete) {
                    if (!willDelete) {
                        return;
                    }
                    axios.delete('/cart/' + id).then(function() {
                        location.reload();
                    })
                })
            });

            // 全选/取消全选按钮
            $('#select-all').change(function() {
                var checked = $(this).prop('checked'); // 获取#select-all的checked属性值
                $('input[name=select][type=checkbox]:not([disabled])').each(function () {
                    $(this).prop('checked', checked);
                })
            })
        })
    </script>
@endsection
