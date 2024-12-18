import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/product.dart';

class OrdersModel {
  String? id;
  String? user;
  List<ProductModel>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;

  int? v;

  OrdersModel({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.v,
  });
}
