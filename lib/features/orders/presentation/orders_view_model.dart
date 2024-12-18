import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersViewModel extends Cubit<OrdersState> {
  final GetOrdersUsecase _getOrdersUsecase;

  OrdersViewModel(this._getOrdersUsecase) : super(OrdersInitialState());

  void doIntent(OrdersIntent intent) {
    switch (intent) {
      case LoadOrders():
        _getOrders();
    }
  }

  Future<void> _getOrders() async {
    emit(OrdersLoadingState());
    final result = await _getOrdersUsecase.getOrders();
    switch (result) {
      case Success<OrdersModel?>():
        emit(OrdersSuccessState(result.data!));
      case Fail<OrdersModel?>():
        emit(OrdersErrorState(result.exception!));
    }
  }
}

sealed class OrdersState {}

class OrdersInitialState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersSuccessState extends OrdersState {
  OrdersModel orders;
  OrdersSuccessState(this.orders);
}

class OrdersErrorState extends OrdersState {
  Exception error;
  OrdersErrorState(this.error);
}

sealed class OrdersIntent {}

class LoadOrders extends OrdersIntent {}
