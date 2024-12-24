import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/orders/domain/models/orders_model.dart';
import 'package:elevate_ecommerce/features/orders/domain/repos/orders_repository.dart';
import 'package:elevate_ecommerce/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_orders_usecase_test.mocks.dart';

@GenerateMocks([OrdersRepository])
void main() {
  late GetOrdersUsecase getOrdersUsecase;
  late MockOrdersRepository mockOrdersRepository;

  setUp(() {
    mockOrdersRepository = MockOrdersRepository();
    getOrdersUsecase = GetOrdersUsecase(mockOrdersRepository);
  });

  group('GetOrdersUsecase Tests', () {
    test('getOrders success on OrdersRepository', () async {
      final mockOrdersModel = OrdersModel();
      provideDummy<Result<OrdersModel?>>(Success(mockOrdersModel));
      final expectedResult = Success(mockOrdersModel);

      when(mockOrdersRepository.getOrders())
          .thenAnswer((_) async => expectedResult);

      final result = await getOrdersUsecase.getOrders();

      expect(result, expectedResult);
      verify(mockOrdersRepository.getOrders()).called(1);
      verifyNoMoreInteractions(mockOrdersRepository);
    });

    test('getOrders failure on OrdersRepository', () async {
      provideDummy<Result<OrdersModel?>>(Fail(Exception()));
      final expectedError = Fail<OrdersModel?>(Exception());

      when(mockOrdersRepository.getOrders())
          .thenAnswer((_) async => expectedError);

      final result = await getOrdersUsecase.getOrders();

      expect(result, expectedError);
      verify(mockOrdersRepository.getOrders()).called(1);
      verifyNoMoreInteractions(mockOrdersRepository);
    });
  });
}
