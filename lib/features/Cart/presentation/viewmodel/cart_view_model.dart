import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/Cart/domain/model/cart_model.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/get_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/remove_item_from_cart_usecase.dart';
import 'package:elevate_ecommerce/features/Cart/domain/usecases/update_cart_product_quantity_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewmodel extends Cubit<CartState> {
  final GetCartUsecase _getCartUsecase;
  final RemoveItemFromCartUsecase _removeItemUsecase;
  final UpdateCartProductQuantityUsecase _updateQuantityUsecase;
  final AddProductToCartUsecase _addProductToCartUsecase;

  CartViewmodel(
    this._getCartUsecase,
    this._removeItemUsecase,
    this._updateQuantityUsecase,
    this._addProductToCartUsecase,
  ) : super(CartInitialState());

  void doIntent(CartIntent intent) {
    switch (intent) {
      case LoadCartIntent():
        _getCart();
        break;
      case RemoveItemIntent():
        _removeItem(intent.productId);
        break;
      case UpdateQuantityIntent():
        _updateQuantity(intent.productId, intent.quantity);
        break;
      case AddProductIntent():
        _addProduct(intent.productId, intent.quantity);
        break;
    }
  }

  Future<void> _getCart() async {
    emit(CartLoadingState());
    final result = await _getCartUsecase.getAllCart();
    switch (result) {
      case Success<CartModel?>():
        emit(CartSuccessState(cartData: result.data));
      case Fail<CartModel?>():
        emit(CartErrorState(exception: result.exception));
    }
  }

  Future<void> _removeItem(String productId) async {
    emit(CartLoadingState());
    final result = await _removeItemUsecase.removeItemFromCart(productId);
    switch (result) {
      case Success<CartModel?>():
        emit(CartSuccessState(cartData: result.data));
      case Fail<CartModel?>():
        emit(CartErrorState(exception: result.exception));
    }
  }

  Future<void> _updateQuantity(String productId, int quantity) async {
    emit(CartLoadingState());
    final result = await _updateQuantityUsecase.updateCartProductQuantity(
        productId, quantity);
    switch (result) {
      case Success<CartModel?>():
        emit(CartSuccessState(cartData: result.data));
      case Fail<CartModel?>():
        emit(CartErrorState(exception: result.exception));
    }
  }

  Future<void> _addProduct(String productId, int quantity) async {
    emit(CartLoadingState());
    final result =
        await _addProductToCartUsecase.addProductToCart(productId, quantity);
    switch (result) {
      case Success<CartModel?>():
        emit(CartSuccessState(cartData: result.data));
      case Fail<CartModel?>():
        emit(CartErrorState(exception: result.exception));
    }
  }
}

sealed class CartIntent {}

class LoadCartIntent extends CartIntent {}

class RemoveItemIntent extends CartIntent {
  final String productId;
  RemoveItemIntent(this.productId);
}

class UpdateQuantityIntent extends CartIntent {
  final String productId;
  final int quantity;
  UpdateQuantityIntent({required this.productId, required this.quantity});
}

class AddProductIntent extends CartIntent {
  final String productId;
  final int quantity;
  AddProductIntent({required this.productId, required this.quantity});
}

sealed class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final CartModel? cartData;
  CartSuccessState({this.cartData});
}

class CartErrorState extends CartState {
  final Exception? exception;
  CartErrorState({this.exception});
}
