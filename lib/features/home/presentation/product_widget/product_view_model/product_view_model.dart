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
class ProductViewModel extends BaseCubit
    implements  ProductViewModelOutput {
  static ProductViewModel get(BuildContext context) => BlocProvider.of(context);

  final GetAllProductsUseCase _getAllProductsUseCase;

  ProductViewModel(this._getAllProductsUseCase);

  List<Products> _productList = [];

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
    }
    else if (result is Fail) {
      final failure = result.toString();
      emit(
        ErrorState(
          failure.toString() ,

        ),
      );
    }
  }

  @override
  List<Products> get getProducts => _productList;
}



abstract class ProductViewModelOutput {
  List<Products> get getProducts;
}
