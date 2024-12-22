part of 'checkout_viewmodel_cubit.dart';

sealed class CheckoutViewmodelState {}

final class CheckoutViewmodelInitial extends CheckoutViewmodelState {}

class PaymentLoadingState extends CheckoutViewmodelState {}

class PaymentSuccessState extends CheckoutViewmodelState {
  final Payment payment;
  final String sessionUrl; // Add this
  PaymentSuccessState(this.payment, this.sessionUrl);
}

class AddressSelectedState extends CheckoutViewmodelState {
  final AddressModel selectedAddress;
  AddressSelectedState(this.selectedAddress);
}

class PaymentErrorState extends CheckoutViewmodelState {
  Exception error;
  PaymentErrorState(this.error);
}

sealed class PaymentIntent {}

class PerformPayment extends PaymentIntent {
  final String userPhone;
  PerformPayment(this.userPhone);
}
