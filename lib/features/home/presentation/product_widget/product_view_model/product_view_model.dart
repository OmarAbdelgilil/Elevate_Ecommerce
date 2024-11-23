import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../utils/string_manager.dart';
import '../../../data/models/response/product_response/ProductResponse.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

@injectable
class ProductViewModel extends BaseCubit {
  final GetAllProductsUseCase _getAllProductsUseCase;
  List<Products> _productList = [];

  ProductViewModel(this._getAllProductsUseCase);

 @override
  void start() => _fetchAllProducts();

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

  List<Products> get getProducts => _productList;

  List<Products> getProductsByCategory(String categoryId) {
    return _productList.where((product) => product.category == categoryId).toList();
  }
  List<Products> getProductsByOccasion(String occasionId) {
    return _productList.where((product) => product.occasion == occasionId).toList();
  }
  List<Products> getProductsByFilter(String filterType, String id) {
    if (filterType == "all") {
      return _productList;
    } else if (filterType == "category") {
      return getProductsByCategory(id);
    }
    else if (filterType == "occasion") {
      return getProductsByOccasion(id);
    }
    return [];
  }
}
