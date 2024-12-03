import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/repos/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUsecase {
  final CartRepository _cartRepository;
  GetCartUsecase(this._cartRepository);
  Future<Result<CartModel?>> getAllCart() async {
    return await _cartRepository.getAllCart();
  }
}
