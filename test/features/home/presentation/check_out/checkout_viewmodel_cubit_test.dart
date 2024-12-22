import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/cubit/checkout_viewmodel_cubit.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/session.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkout_viewmodel_cubit_test.mocks.dart';

@GenerateMocks([PaymentUsecase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CheckoutViewmodelCubit viewModel;
  late MockPaymentUsecase mockPaymentUsecase;

  setUp(() {
    mockPaymentUsecase = MockPaymentUsecase();
    viewModel = CheckoutViewmodelCubit(mockPaymentUsecase);

    provideDummy<Result<Payment?>>(
        Success(Payment(session: Session(url: 'http://example.com/session'))));
    provideDummy<Result<Payment?>>(
        Fail(Exception('Failed to process payment')));
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
        'doIntent with PerformPayment emits PaymentLoadingState and PaymentSuccessState on success',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);

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
        'doIntent with PerformPayment emits PaymentLoadingState and PaymentErrorState on failure',
        () async {
      final address = AddressModel(
          street: '123 Main St', phone: '1234567890', city: 'City', id: '1');
      viewModel.setSelectedAddress(address);

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
  });
}
