import 'dart:convert';

import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_cubit.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/Order_response.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/presentation/base/base_states.dart';
import '../../data/models/response/Orders.dart';

@injectable
class OrdersViewModel extends BaseCubit {
  final GetOrdersUsecase _getOrdersUsecase;

  OrdersViewModel(this._getOrdersUsecase) ;
late List<Orders> _ordersList = [];

  static OrdersViewModel get(BuildContext context) =>
      BlocProvider.of<OrdersViewModel>(context);
  Future<void> _getOrders() async {
    emit(LoadingState());
    final prefs = await SharedPreferences.getInstance();

    final cachedOrders = prefs.getString('orders_list');
    List<Orders> cachedOrderList = [];

    if (cachedOrders != null) {
      cachedOrderList = List<Orders>.from(
        json.decode(cachedOrders).map((x) => Orders.fromJson(x)),
      );
      _ordersList = cachedOrderList;
      emit(ContentState());
    }

    final result = await _getOrdersUsecase.getOrders();

    if (result is Success<OrderResponse?>) {
      if (result.data != null && result.data!.orders?.isNotEmpty == true) {
        final newOrdersList = result.data!.orders!;

        final newOrdersJson = json.encode(newOrdersList.map((x) => x.toJson()).toList());
        final oldOrdersJson = json.encode(cachedOrderList.map((x) => x.toJson()).toList());

        if (newOrdersJson != oldOrdersJson) {
          await prefs.setString('orders_list', newOrdersJson);
          _ordersList = newOrdersList;

          emit(SuccessState('New orders Added'));
        } else {
          emit(SuccessState('No new orders found.'));
        }
      } else {
        emit(ErrorState("No orders found."));
      }
    } else if (result is Fail<OrderResponse?>) {
      emit(ErrorState(result.data?.error ?? "Unknown error"));
    }
  }


  List<Orders> getCompletedOrders() {
    return _ordersList.where((order) => order.state == 'completed').toList();
  }

  List<Orders> _getOtherOrders() {
    return _ordersList.where((order) => order.state != 'completed').toList();
  }
 List<Orders> get orderList => _ordersList;


  @override
  void start() {
    _getOrders();
  }


}

