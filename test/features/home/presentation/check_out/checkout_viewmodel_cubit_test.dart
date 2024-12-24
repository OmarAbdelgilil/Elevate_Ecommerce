import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/cubit/checkout_viewmodel_cubit.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/session.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/create_cache_order_usecase.dart'; // Import new use case
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_viewmodel_cubit_test.mocks.dart';

@GenerateMocks([PaymentUsecase, CreateCacheOrderUsecase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CheckoutViewmodelCubit viewModel;
  late MockPaymentUsecase mockPaymentUsecase;
  late MockCreateCacheOrderUsecase mockCreateCacheOrderUsecase;

  setUp(() {
    mockPaymentUsecase = MockPaymentUsecase();
    mockCreateCacheOrderUsecase = MockCreateCacheOrderUsecase();
    viewModel =
        CheckoutViewmodelCubit(mockPaymentUsecase, mockCreateCacheOrderUsecase);

    // Provide dummy values for Result<Payment?> and Result<CreateOrder?>
    provideDummy<Result<Payment?>>(
        Success(Payment(session: Session(url: 'http://example.com/session'))));
    provideDummy<Result<CreateOrder?>>(
        Success(CreateOrder(message: "Order created", order: null)));
  });

  group('CheckoutViewmodelCubit Tests', () {
    test('initial state is CheckoutViewmodelInitial', () {
      expect(viewModel.state, isA<CheckoutViewmodelInitial>());
    });

    test('setSelectedAddress emits AddressSelectedState', () {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);
      expect(viewModel.state, isA<AddressSelectedState>());
    });

    test(
        'doIntent with PerformPayment (Credit Card) emits PaymentLoadingState and PaymentSuccessState on success',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);
      viewModel
          .setPaymentMethod('Credit card'); // Set payment method to Credit Card

      when(mockPaymentUsecase.getPayment(any)).thenAnswer(
        (_) async => Success(
            Payment(session: Session(url: 'http://example.com/session'))),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<PaymentLoadingState>(),
          isA<PaymentSuccessState>(),
        ]),
      );

      viewModel.doIntent(PerformPayment('1234567890'));
    });

    test(
        'doIntent with PerformPayment (Credit Card) emits PaymentLoadingState and PaymentErrorState on failure',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);
      viewModel
          .setPaymentMethod('Credit card'); // Set payment method to Credit Card

      when(mockPaymentUsecase.getPayment(any)).thenAnswer(
        (_) async => Fail(Exception('Failed to process payment')),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<PaymentLoadingState>(),
          isA<PaymentErrorState>(),
        ]),
      );

      viewModel.doIntent(PerformPayment('1234567890'));
    });

    test(
        'doIntent with PerformPayment (Cash on Delivery) emits PaymentLoadingState and CashOnDeliverySuccessState on success',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);
      viewModel.setPaymentMethod(
          'Cash on delivery'); // Set payment method to Cash on Delivery

      when(mockCreateCacheOrderUsecase.getPayment(any)).thenAnswer(
        (_) async =>
            Success(CreateOrder(message: "Order created", order: null)),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<PaymentLoadingState>(),
          isA<CashOnDeliverySuccessState>(),
        ]),
      );

      viewModel.doIntent(PerformPayment('1234567890'));
    });

    test(
        'doIntent with PerformPayment (Cash on Delivery) emits PaymentLoadingState and PaymentErrorState on failure',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);
      viewModel.setPaymentMethod(
          'Cash on delivery'); // Set payment method to Cash on Delivery

      when(mockCreateCacheOrderUsecase.getPayment(any)).thenAnswer(
        (_) async => Fail(Exception('Failed to create order')),
      );

      expectLater(
        viewModel.stream,
        emitsInOrder([
          isA<PaymentLoadingState>(),
          isA<PaymentErrorState>(),
        ]),
      );

      viewModel.doIntent(PerformPayment('1234567890'));
    });
  });
}
