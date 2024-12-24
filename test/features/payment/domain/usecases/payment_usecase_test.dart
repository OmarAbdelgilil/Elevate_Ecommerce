import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/repos/payment_repo.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_usecase_test.mocks.dart';

@GenerateMocks([PaymentRepo])
void main() {
  late PaymentUsecase paymentUsecase;
  late MockPaymentRepo mockPaymentRepo;

  setUp(() {
    mockPaymentRepo = MockPaymentRepo();
    paymentUsecase = PaymentUsecase(mockPaymentRepo);

    provideDummy<Result<Payment?>>(
        Success(Payment(message: "Dummy payment", session: null)));
  });

  group('PaymentUsecase Tests', () {
    test('getPayment success on PaymentRepo', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedPayment =
          Payment(message: "Payment successful", session: null);
      final expectedResult = Success(expectedPayment);

      when(mockPaymentRepo.getPayment(paymentRequest))
          .thenAnswer((_) async => expectedResult);

      final result = await paymentUsecase.getPayment(paymentRequest);

      expect(result, expectedResult);
      verify(mockPaymentRepo.getPayment(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentRepo);
    });

    test('getPayment failure on PaymentRepo', () async {
      final paymentRequest = PaymentRequest();
      final expectedError =
          Fail<Payment?>(Exception('Error processing payment'));

      when(mockPaymentRepo.getPayment(paymentRequest))
          .thenAnswer((_) async => expectedError);

      final result = await paymentUsecase.getPayment(paymentRequest);

      expect(result, expectedError);
      verify(mockPaymentRepo.getPayment(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentRepo);
    });
  });
}
