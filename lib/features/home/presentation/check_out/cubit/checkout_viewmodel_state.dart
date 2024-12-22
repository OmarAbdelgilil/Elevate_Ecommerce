part of 'checkout_viewmodel_cubit.dart';

sealed class CheckoutViewmodelState {}

final class CheckoutViewmodelInitial extends CheckoutViewmodelState {}

class PaymentLoadingState extends CheckoutViewmodelState {}

class PaymentSuccessState extends CheckoutViewmodelState {
  Payment payment;
  PaymentSuccessState(this.payment);
}

class PaymentErrorState extends CheckoutViewmodelState {
  Exception error;
  PaymentErrorState(this.error);
}

sealed class PaymentIntent {}

class PerformPayment extends PaymentIntent {
  PaymentRequest paymentRequest;
  PerformPayment(this.paymentRequest);
}
