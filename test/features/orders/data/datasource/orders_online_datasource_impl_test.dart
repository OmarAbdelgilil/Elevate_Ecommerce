import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/orders/data/datasource/orders_online_datasource_impl.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/order_response.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/orders.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late OrdersOnlineDatasourceImpl ordersOnlineDatasource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    ordersOnlineDatasource = OrdersOnlineDatasourceImpl(mockApiManager);
  });

  group('OrdersOnlineDatasourceImpl Tests', () {
    test('getCart success on ApiManager', () async {
      when(mockApiManager.getOrders()).thenAnswer((_) async => OrderResponse(
          message: '',
          orders: Orders(
              id: '1',
              isDelivered: true,
              isPaid: true,
              orderItems: [],
              paymentType: '',
              totalPrice: 0,
              user: '',
              v: 1)));

      final result = await ordersOnlineDatasource.getCart();

      expect(result, isA<Success<OrdersModel?>>());
      verify(mockApiManager.getOrders()).called(1);
    });

    test('getCart failure on ApiManager', () async {
      when(mockApiManager.getOrders())
          .thenThrow(Exception('Error fetching orders'));

      final result = await ordersOnlineDatasource.getCart();

      expect(result, isA<Fail<OrdersModel?>>());
      verify(mockApiManager.getOrders()).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
