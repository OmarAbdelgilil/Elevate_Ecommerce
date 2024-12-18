import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/orders/presentation/active_orders.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: StringsManager.myOrder.tr()),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                dividerHeight: 0,
                indicatorColor: ColorManager.primary,
                labelColor: ColorManager.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Text(StringsManager.ordersActive.tr(),
                        style: TextStyle(fontSize: 16)),
                  ),
                  Tab(
                    child: Text(
                      StringsManager.completedOrders.tr(),
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ActiveOrders(),
                    Center(child: Text('Completed Orders')),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
