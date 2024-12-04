import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartProductQuantityUsecase {
  final CartRepository _cartRepository;
  UpdateCartProductQuantityUsecase(this._cartRepository);
  Future<Result<CartModel?>> updateCartProductQuantity(
      String productId, int quantity) async {
    return await _cartRepository.updateCartProductQuantity(productId, quantity);
  }
}
