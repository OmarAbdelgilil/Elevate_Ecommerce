import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/repos/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCacheOrderUsecase {
  final PaymentRepo paymentRepo;

  CreateCacheOrderUsecase(this.paymentRepo);
  Future<Result<CreateOrder?>> getPayment(PaymentRequest paymentRequest) {
    return paymentRepo.createOrder(paymentRequest);
  }
}
