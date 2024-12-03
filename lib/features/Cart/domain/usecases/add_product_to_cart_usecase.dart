import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductToCartUsecase {
  final CartRepository _cartRepository;
  AddProductToCartUsecase(this._cartRepository);
  Future<Result<CartModel?>> addProductToCart(
      String productId, int quantity) async {
    return await _cartRepository.addProductToCart(productId, quantity);
  }
}
