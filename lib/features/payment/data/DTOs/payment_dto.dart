import 'package:elevate_ecommerce/features/payment/data/models/payment/session.dart';
import 'package:elevate_ecommerce/features/payment/domain/models/payment.dart';

class PaymentDto {
  String? message;
  Session session;

  PaymentDto({this.message, required this.session});

  PaymentModel toPaymentModel() {
    return PaymentModel(
      message: message,
      session: session,
    );
  }
}
