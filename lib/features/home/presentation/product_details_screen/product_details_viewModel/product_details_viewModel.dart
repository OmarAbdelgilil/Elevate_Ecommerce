import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/product_details_useCase.dart';

@injectable
class ProductDetails_ViewModel extends Cubit<ProductDetailsState> {
  final ProductDetailsUsecase _productDetailsUsecase;

  ProductDetails_ViewModel(this._productDetailsUsecase) : super(InitialState());

  void doIntent(ProductDetailsIntent intent) {
    if (intent is LoadProductDetailsIntent) {
      _getProductDetails(intent.productId);
    }
  }

  Future<void> _getProductDetails(String productId) async {
    emit(LoadingState());

    final result = await _productDetailsUsecase.getProductDetails(productId);

    if (result is Success<ProductDetailsResponse?>) {
      if (result.data?.product != null) {
        final productDetails = result.data!.product!.toModel();
        emit(SuccessState(productDetails: productDetails));
      } else {
        emit(ErrorState(exception: Exception("No product details found")));
      }
    } else if (result is Fail<ProductDetailsResponse?>) {
      emit(ErrorState(exception: result.exception));
    }
  }
}

sealed class ProductDetailsIntent {}

class LoadProductDetailsIntent extends ProductDetailsIntent {
  final String productId;
  LoadProductDetailsIntent(this.productId);
}

sealed class ProductDetailsState {}

class InitialState extends ProductDetailsState {}

class LoadingState extends ProductDetailsState {}

class SuccessState extends ProductDetailsState {
  final ProductsModel productDetails;

  SuccessState({required this.productDetails});
}

class ErrorState extends ProductDetailsState {
  final Exception? exception;
  ErrorState({this.exception});
}
