import 'package:dio/dio.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/orders/data/contracts/orders_online_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../models/response/Order_response.dart';

@Injectable(as: OrdersOnlineDatasource)
class OrdersOnlineDatasourceImpl implements OrdersOnlineDatasource {
  final ApiManager apiManager;
  OrdersOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<OrderResponse?>> getCart() async {
    try {
      var result = await apiManager.getOrders();
      return Success(result);
    } catch (e) {
      if (e is DioException) {
        String errorMessage = _handleDioError(e);
        return Fail(Exception(errorMessage), data: OrderResponse(error: errorMessage));
      }
      if (kDebugMode) {
        print("General Error: $e");
      }
      return Fail(Exception(e.toString()));
    }
  }
  String _handleDioError(DioException e) {
    if (e.response != null && e.response?.data != null) {
      try {
        final errorData = e.response?.data;
        if (errorData is Map<String, dynamic> && errorData.containsKey("error")) {
          return errorData["error"];
        }
      } catch (error) {
        return "Error processing response.";
      }
    }
    return e.message ?? "An unknown error occurred.";
  }
}
