import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/features/orders/presentation/view/widgets/order_item.dart';
import 'package:elevate_ecommerce/features/orders/presentation/view_model/orders_view_model.dart';
import 'package:elevate_ecommerce/features/track_order/track_order_screen/view/track_order_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key, required this.viewModel});

  final OrdersViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: viewModel.orderList.isEmpty
          ? const Text('No orders found')
          : Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          height: ScreenUtil().screenHeight - 10,
          child: ListView.builder(
              itemCount: viewModel.orderList.length,
              itemBuilder: (context, index) {
                final order = viewModel.orderList[index];

                return Column(
                  children: order.orderItems?.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderItemWidget(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrderScreen(orderId: order.id??''),));
                        },
                        title: item.product?.title ?? '',
                        image: item.product?.images?.isNotEmpty == true
                            ? item.product!.images![0]
                            : '',
                        orderNumber: order.orderNumber ?? '',
                        price: order.totalPrice.toString(),
                        orderId: order.id!,
                      ),
                    );
                  }).toList() ?? [const Text('No items in this order')],
                );
              }
          ),
        ),
      ),
    );
  }


}
