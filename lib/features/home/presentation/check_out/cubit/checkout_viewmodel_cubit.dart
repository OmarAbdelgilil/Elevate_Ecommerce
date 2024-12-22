import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/shipping_address.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:injectable/injectable.dart';

part 'checkout_viewmodel_state.dart';

@injectable
class CheckoutViewmodelCubit extends Cubit<CheckoutViewmodelState> {
  final PaymentUsecase paymentUsecase;
  AddressModel? selectedAddress;

  CheckoutViewmodelCubit(this.paymentUsecase)
      : super(CheckoutViewmodelInitial());

  void setSelectedAddress(AddressModel address) {
    selectedAddress = address;
    emit(AddressSelectedState(address));
  }

  void doIntent(PaymentIntent intent) {
    switch (intent) {
      case PerformPayment():
        if (selectedAddress != null) {
          _doPayment(PaymentRequest(
            shippingAddress: ShippingAddress(
              street: selectedAddress!.street,
              phone: intent.userPhone,
              city: selectedAddress!.city,
            ),
          ));
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
}
