import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/usecases/payment_usecase.dart';
import 'package:injectable/injectable.dart';

part 'checkout_viewmodel_state.dart';

@injectable
class CheckoutViewmodelCubit extends Cubit<CheckoutViewmodelState> {
  final PaymentUsecase paymentUsecase;
  CheckoutViewmodelCubit(this.paymentUsecase)
      : super(CheckoutViewmodelInitial());
  void doIntent(PaymentIntent intent) {
    switch (intent) {
      case PerformPayment():
        _doPayment(intent.paymentRequest);
    }
  }

  Future<void> _doPayment(PaymentRequest payment) async {
    emit(PaymentLoadingState());
    final result = await paymentUsecase.getPayment(payment);
    switch (result) {
      case Success<Payment?>():
        emit(PaymentSuccessState(result.data!));
      case Fail<Payment?>():
        emit(PaymentErrorState(result.exception!));
    }
  }
}
