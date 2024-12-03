import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';

abstract class CartRepository {
  Future<Result<CartModel?>> getAllCart();
  Future<Result<bool?>> addProductToCart(String productId, int quantity);
  Future<Result<CartModel?>> updateCartProductQuantity(
      String productId, int quantity);
  Future<Result<bool?>> removeItemFromCart(String productId);
}
