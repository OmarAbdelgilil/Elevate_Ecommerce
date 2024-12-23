import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/payment/data/contracts/payment_online_datasource.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentOnlineDatasource)
class PaymentOnlineDatasourceImpl implements PaymentOnlineDatasource {
  final ApiManager apiManager;

  PaymentOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<Payment?>> getPayment(PaymentRequest paymentRequest) {
    return executeApi(() async {
      final result = await apiManager.doPayment(paymentRequest);

      return result;
    });
  }

  @override
  Future<Result<CreateOrder?>> createOrder(PaymentRequest paymentRequest) {
    return executeApi(() async {
      final result = await apiManager.createOrder(paymentRequest);

      return result;
    });
  }
}
