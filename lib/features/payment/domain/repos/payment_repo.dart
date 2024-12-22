import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';

abstract class PaymentRepo {
  Future<Result<Payment?>> getPayment(PaymentRequest paymentRequest);
}
