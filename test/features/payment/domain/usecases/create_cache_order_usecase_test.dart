import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/repos/payment_repo.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/create_cache_order_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_usecase_test.mocks.dart';

@GenerateMocks([PaymentRepo])
void main() {
  late CreateCacheOrderUsecase createCacheOrderUsecase;
  late MockPaymentRepo mockPaymentRepo;

  setUp(() {
    mockPaymentRepo = MockPaymentRepo();
    createCacheOrderUsecase = CreateCacheOrderUsecase(mockPaymentRepo);

    provideDummy<Result<CreateOrder?>>(
        Success(CreateOrder(message: "Dummy order created", order: null)));
  });

  group('CreateCacheOrderUsecase Tests', () {
    test('getPayment success on PaymentRepo', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedCreateOrder =
          CreateOrder(message: "Order created", order: null);
      final expectedResult = Success(expectedCreateOrder);

      when(mockPaymentRepo.createOrder(paymentRequest))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await createCacheOrderUsecase.getPayment(paymentRequest);

      // Assert
      expect(result, expectedResult);
      verify(mockPaymentRepo.createOrder(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentRepo);
    });

    test('getPayment failure on PaymentRepo', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedError =
          Fail<CreateOrder?>(Exception('Error creating order'));

      when(mockPaymentRepo.createOrder(paymentRequest))
          .thenAnswer((_) async => expectedError);

      // Act
      final result = await createCacheOrderUsecase.getPayment(paymentRequest);

      // Assert
      expect(result, expectedError);
      verify(mockPaymentRepo.createOrder(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentRepo);
    });
  });
}
