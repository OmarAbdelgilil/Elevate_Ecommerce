import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/data/contracts/orders_online_datasource.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/data/repos/orders_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_repository_impl_test.mocks.dart';

@GenerateMocks([OrdersOnlineDatasource])
void main() {
  late OrdersRepositoryImpl ordersRepository;
  late MockOrdersOnlineDatasource mockOrdersOnlineDatasource;

  setUp(() {
    mockOrdersOnlineDatasource = MockOrdersOnlineDatasource();
    ordersRepository = OrdersRepositoryImpl(mockOrdersOnlineDatasource);
  });

  group('OrdersRepositoryImpl Tests', () {
    test('getOrders success on OrdersOnlineDatasource', () async {
      final mockOrders = OrdersModel();
      provideDummy<Result<OrdersModel?>>(Success(mockOrders));
      final expectedResult = Success(mockOrders);

      when(mockOrdersOnlineDatasource.getCart())
          .thenAnswer((_) async => expectedResult);

      final result = await ordersRepository.getOrders();

      expect(result, expectedResult);
      verify(mockOrdersOnlineDatasource.getCart()).called(1);
      verifyNoMoreInteractions(mockOrdersOnlineDatasource);
    });

    test('getOrders failure on OrdersOnlineDatasource', () async {
      provideDummy<Result<OrdersModel?>>(Fail(Exception()));
      final expectedError = Fail<OrdersModel?>(Exception());

      when(mockOrdersOnlineDatasource.getCart())
          .thenAnswer((_) async => expectedError);

      final result = await ordersRepository.getOrders();

      expect(result, expectedError);
      verify(mockOrdersOnlineDatasource.getCart()).called(1);
      verifyNoMoreInteractions(mockOrdersOnlineDatasource);
    });
  });
}
