import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/shipping_address.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/create_cache_order_usecase.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:injectable/injectable.dart';

part 'checkout_viewmodel_state.dart';

@injectable
class CheckoutViewmodelCubit extends Cubit<CheckoutViewmodelState> {
  final PaymentUsecase paymentUsecase;
  final CreateCacheOrderUsecase createCacheOrderUsecase; // Add new use case
  AddressModel? selectedAddress;
  String selectedPaymentMethod = 'Cash on delivery'; // Default payment method

  CheckoutViewmodelCubit(this.paymentUsecase, this.createCacheOrderUsecase)
      : super(CheckoutViewmodelInitial());

  void setSelectedAddress(AddressModel address) {
    selectedAddress = address;
    emit(AddressSelectedState(address));
  }

  void setPaymentMethod(String method) {
    selectedPaymentMethod = method; // Store selected payment method
  }

  void doIntent(PaymentIntent intent) {
    switch (intent) {
      case PerformPayment():
        if (selectedAddress != null) {
          if (selectedPaymentMethod == 'Credit card') {
            _doPayment(PaymentRequest(
              shippingAddress: ShippingAddress(
                street: selectedAddress!.street,
                phone: intent.userPhone,
                city: selectedAddress!.city,
              ),
            ));
          } else if (selectedPaymentMethod == 'Cash on delivery') {
            _createCacheOrder(PaymentRequest(
              shippingAddress: ShippingAddress(
                street: selectedAddress!.street,
                phone: intent.userPhone,
                city: selectedAddress!.city,
              ),
            ));
          }
        }
    }
  }

  Future<void> _doPayment(PaymentRequest payment) async {
    emit(PaymentLoadingState());
    final result = await paymentUsecase.getPayment(payment);

    switch (result) {
      case Success<Payment?>():
        final sessionUrl = result.data?.session?.url;
        if (sessionUrl != null) {
          emit(PaymentSuccessState(result.data!, sessionUrl));
        } else {
          emit(PaymentErrorState(Exception("Session URL not found")));
        }
        break;
      case Fail<Payment?>():
        emit(PaymentErrorState(result.exception!));
        break;
    }
  }

  Future<void> _createCacheOrder(PaymentRequest payment) async {
    emit(PaymentLoadingState());
    final result = await createCacheOrderUsecase.getPayment(payment);

    switch (result) {
      case Success<CreateOrder?>():
        if (result.data != null) {
          emit(CashOnDeliverySuccessState(
              result.data!)); // Emit new success state
        } else {
          emit(PaymentErrorState(Exception("Create order failed")));
        }
        break;
      case Fail<CreateOrder?>():
        emit(PaymentErrorState(result.exception!));
        break;
    }
  }
}
