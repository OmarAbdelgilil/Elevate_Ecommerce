import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/data/contracts/cart_online_datasource.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartOnlineDatasource _cartOnlineDatasource;
  CartRepositoryImpl(this._cartOnlineDatasource);
  @override
  Future<Result<bool?>> addProductToCart(String productId, int quantity) async {
    return await _cartOnlineDatasource.addProductToCart(productId, quantity);
  }

  @override
  Future<Result<CartModel?>> getAllCart() async {
    return await _cartOnlineDatasource.getAllCart();
  }

  @override
  Future<Result<bool?>> removeItemFromCart(String productId) async {
    return await _cartOnlineDatasource.removeItemFromCart(productId);
  }

  @override
  Future<Result<CartModel?>> updateCartProductQuantity(
      String productId, int quantity) async {
    return await _cartOnlineDatasource.updateCartProductQuantity(
        productId, quantity);
  }
}
