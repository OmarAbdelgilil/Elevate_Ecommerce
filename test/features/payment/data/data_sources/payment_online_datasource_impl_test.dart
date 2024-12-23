import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/payment/data/data_sources/payment_online_datasource_impl.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_online_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late PaymentOnlineDatasourceImpl paymentOnlineDatasource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    paymentOnlineDatasource = PaymentOnlineDatasourceImpl(mockApiManager);
  });

  group('PaymentOnlineDatasourceImpl Tests', () {
    test('getPayment success on ApiManager', () async {
      final paymentRequest = PaymentRequest();
      final expectedPayment =
          Payment(message: "Payment successful", session: null);

      when(mockApiManager.doPayment(paymentRequest))
          .thenAnswer((_) async => expectedPayment);

      final result = await paymentOnlineDatasource.getPayment(paymentRequest);

      expect(result, isA<Success<Payment?>>());
      expect((result as Success<Payment?>).data, expectedPayment);
      verify(mockApiManager.doPayment(paymentRequest)).called(1);
    });

    test('getPayment failure on ApiManager', () async {
      final paymentRequest = PaymentRequest();

      when(mockApiManager.doPayment(paymentRequest))
          .thenThrow(Exception('Error processing payment'));

      final result = await paymentOnlineDatasource.getPayment(paymentRequest);

      expect(result, isA<Fail<Payment?>>());
      verify(mockApiManager.doPayment(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });

    test('createOrder success on ApiManager', () async {
      final paymentRequest = PaymentRequest();
      final expectedCreateOrder =
          CreateOrder(message: "Order created", order: null);

      when(mockApiManager.createOrder(paymentRequest))
          .thenAnswer((_) async => expectedCreateOrder);

      final result = await paymentOnlineDatasource.createOrder(paymentRequest);

      expect(result, isA<Success<CreateOrder?>>());
      expect((result as Success<CreateOrder?>).data, expectedCreateOrder);
      verify(mockApiManager.createOrder(paymentRequest)).called(1);
    });

    test('createOrder failure on ApiManager', () async {
      final paymentRequest = PaymentRequest();

      when(mockApiManager.createOrder(paymentRequest))
          .thenThrow(Exception('Error creating order'));

      final result = await paymentOnlineDatasource.createOrder(paymentRequest);

      expect(result, isA<Fail<CreateOrder?>>());
      verify(mockApiManager.createOrder(paymentRequest)).called(1);
      verifyNoMoreInteractions(mockApiManager);
    });
  });
}
