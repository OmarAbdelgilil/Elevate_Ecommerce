import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/payment/data/contracts/payment_online_datasource.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/payment/domain/repos/payment_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepo)
class PaymentRepoImpl implements PaymentRepo {
  final PaymentOnlineDatasource paymentOnlineDatasource;

  PaymentRepoImpl(this.paymentOnlineDatasource);
  @override
  Future<Result<Payment?>> getPayment(PaymentRequest paymentRequest) {
    return paymentOnlineDatasource.getPayment(paymentRequest);
  }

  Future<Result<CreateOrder?>> createOrder(PaymentRequest paymentRequest) {
    return paymentOnlineDatasource.createOrder(paymentRequest);
  }
}
