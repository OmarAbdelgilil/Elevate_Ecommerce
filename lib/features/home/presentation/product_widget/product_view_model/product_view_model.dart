import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/response/product_response/Products.dart';
import '../../base/base_cubit.dart';
@injectable
class ProductViewModel extends BaseCubit implements ProductViewModelOutput {
  static ProductViewModel get(BuildContext context) => BlocProvider.of(context);

  final GetAllProductsUseCase _getAllProductsUseCase;
  List<Products> _productList = [];

  ProductViewModel(this._getAllProductsUseCase);

  @override
  void start() {
    _fetchAllProducts();
  }

  Future<void> _fetchAllProducts() async {
    emit(LoadingState());
    final result = await _getAllProductsUseCase.getAllProducts();

    if (result is Success<ProductResponse?>) {
      final response = result.data;
      if (response != null && response.products!.isNotEmpty) {
        _productList = response.products!;
        emit(ContentState());
      } else {
        emit(EmptyState(message: StringsManager.noProductsFound));
      }
    } else if (result is Fail) {
      emit(ErrorState(result.toString()));
    }
  }

  @override
  List<Products> get getProducts => _productList;


  List<Products> getProductsByCategory(String categoryId) {
    return _productList.where((product) => product.category == categoryId).toList();
  }


  List<Products> getProductsByOccasion(String occasionId) {
    return _productList.where((product) => product.occasion == occasionId).toList();
  }
}

abstract class ProductViewModelOutput {
  List<Products> get getProducts;
}
