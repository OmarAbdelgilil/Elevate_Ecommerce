import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/features/orders/presentation/order_item.dart';
import 'package:elevate_ecommerce/features/orders/presentation/orders_view_model.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersViewModel viewModel = getIt<OrdersViewModel>();

    return BlocProvider(
        create: (context) => viewModel..doIntent(LoadOrders()),
        child: BlocBuilder<OrdersViewModel, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }
            if (state is OrdersSuccessState) {
              return Center(
                child: state.orders.orderItems!.isEmpty
                    ? const Text('No orders found')
                    : Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SizedBox(
                          height: ScreenUtil().screenHeight - 10,
                          child: ListView.builder(
                            itemCount: state.orders.orderItems!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: OrderItemWidget(
                                orderId: state.orders.id!,
                                product: state.orders.orderItems![index],
                              ),
                            ),
                          ),
                        )),
              );
            }
            if (state is OrdersErrorState) {
              return Center(
                child: Text(extractErrorMessage(state.error)),
              );
            }
            return const Placeholder();
          },
        ));
  }
}
