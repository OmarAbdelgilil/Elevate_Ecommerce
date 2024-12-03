import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveItemFromCartUsecase {
  final CartRepository _cartRepository;
  RemoveItemFromCartUsecase(this._cartRepository);
  Future<Result<CartModel?>> removeItemFromCart(String productId) async {
    return await _cartRepository.removeItemFromCart(productId);
  }
}
