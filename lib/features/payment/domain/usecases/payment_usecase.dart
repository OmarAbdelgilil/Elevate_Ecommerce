import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/repos/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentUsecase {
  final PaymentRepo paymentRepo;

  PaymentUsecase(this.paymentRepo);
  Future<Result<Payment?>> getPayment(PaymentRequest paymentRequest) {
    return paymentRepo.getPayment(paymentRequest);
  }
}
