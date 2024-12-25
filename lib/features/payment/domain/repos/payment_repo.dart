import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';

abstract class PaymentRepo {
  Future<Result<Payment?>> getPayment(PaymentRequest paymentRequest);
  Future<Result<CreateOrder?>> createOrder(PaymentRequest paymentRequest);
}
