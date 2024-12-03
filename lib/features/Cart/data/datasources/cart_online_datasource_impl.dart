import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/Cart/data/DTOs/cart_dto.dart';
import 'package:elevate_ecommerce/features/Cart/data/contracts/cart_online_datasource.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartOnlineDatasource)
class CartOnlineDatasourceImpl implements CartOnlineDatasource {
  final ApiManager apiManager;
  CartOnlineDatasourceImpl(this.apiManager);
  @override
  Future<Result<CartModel?>> addProductToCart(String productId, int quantity) {
    return executeApi(
      () async {
        final result = await apiManager.addProductToCart(
            AddCartProductRequest(product: productId, quantity: quantity));
        return CartDto(
                cartItems: result!.cart!.cartItems,
                id: result.cart!.id,
                totalPrice: result.cart!.totalPrice,
                user: result.cart!.user,
                numOfCartItems: result.numOfCartItems)
            .toCartModel();
      },
    );
  }

  @override
  Future<Result<CartModel?>> getAllCart() {
    return executeApi(
      () async {
        final result = await apiManager.getAllCart();
        return CartDto(
                cartItems: result!.cart!.cartItems,
                id: result.cart!.id,
                totalPrice: result.cart!.totalPrice,
                user: result.cart!.user,
                numOfCartItems: result.numOfCartItems)
            .toCartModel();
      },
    );
  }

  @override
  Future<Result<CartModel?>> removeItemFromCart(String productId) {
    return executeApi(
      () async {
        final result = await apiManager.removeItemFromCart(productId);
        return CartDto(
                cartItems: result!.cart!.cartItems,
                id: result.cart!.id,
                totalPrice: result.cart!.totalPrice,
                user: result.cart!.user,
                numOfCartItems: result.numOfCartItems)
            .toCartModel();
      },
    );
  }

  @override
  Future<Result<CartModel?>> updateCartProductQuantity(
      String productId, int quantity) {
    return executeApi(
      () async {
        final result = await apiManager.updateCartProductQuantity(
            productId, UpdateCartProductQuantityRequest(quantity: quantity));
        return CartDto(
                cartItems: result!.cart!.cartItems,
                id: result.cart!.id,
                totalPrice: result.cart!.totalPrice,
                user: result.cart!.user,
                numOfCartItems: result.numOfCartItems)
            .toCartModel();
      },
    );
  }
}
