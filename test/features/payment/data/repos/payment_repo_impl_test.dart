import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/contracts/payment_online_datasource.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/data/repos/payment_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_repo_impl_test.mocks.dart';

@GenerateMocks([PaymentOnlineDatasource])
void main() {
  late PaymentRepoImpl paymentRepo;
  late MockPaymentOnlineDatasource mockPaymentOnlineDatasource;

  setUp(() {
    mockPaymentOnlineDatasource = MockPaymentOnlineDatasource();
    paymentRepo = PaymentRepoImpl(mockPaymentOnlineDatasource);

    provideDummy<Result<Payment?>>(
        Success(Payment(message: "Dummy payment", session: null)));
    provideDummy<Result<CreateOrder?>>(
        Success(CreateOrder(message: "Dummy order created", order: null)));
  });

  group('PaymentRepoImpl Tests', () {
    test('getPayment success on PaymentOnlineDatasource', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedPayment =
          Payment(message: "Payment successful", session: null);
      final expectedResult = Success(expectedPayment);

      when(mockPaymentOnlineDatasource.getPayment(paymentRequest))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await paymentRepo.getPayment(paymentRequest);

      // Assert
      expect(result, expectedResult);
      verify(mockPaymentOnlineDatasource.getPayment(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentOnlineDatasource);
    });

    test('getPayment failure on PaymentOnlineDatasource', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedError =
          Fail<Payment?>(Exception('Error processing payment'));

      when(mockPaymentOnlineDatasource.getPayment(paymentRequest))
          .thenAnswer((_) async => expectedError);

      // Act
      final result = await paymentRepo.getPayment(paymentRequest);

      // Assert
      expect(result, expectedError);
      verify(mockPaymentOnlineDatasource.getPayment(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentOnlineDatasource);
    });

    test('createOrder success on PaymentOnlineDatasource', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedCreateOrder =
          CreateOrder(message: "Order created", order: null);
      final expectedResult = Success(expectedCreateOrder);

      when(mockPaymentOnlineDatasource.createOrder(paymentRequest))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await paymentRepo.createOrder(paymentRequest);

      // Assert
      expect(result, expectedResult);
      verify(mockPaymentOnlineDatasource.createOrder(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentOnlineDatasource);
    });

    test('createOrder failure on PaymentOnlineDatasource', () async {
      // Arrange
      final paymentRequest = PaymentRequest();
      final expectedError =
          Fail<CreateOrder?>(Exception('Error creating order'));

      when(mockPaymentOnlineDatasource.createOrder(paymentRequest))
          .thenAnswer((_) async => expectedError);

      // Act
      final result = await paymentRepo.createOrder(paymentRequest);

      // Assert
      expect(result, expectedError);
      verify(mockPaymentOnlineDatasource.createOrder(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockPaymentOnlineDatasource);
    });
  });
}
