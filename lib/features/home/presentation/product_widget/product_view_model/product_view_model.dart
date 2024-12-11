import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';
import '../../../../../core/cache/shared_preferences_service.dart';
import '../../../../../utils/string_manager.dart';
import '../../../data/models/response/best_seller_product_response/BestSeller.dart';
import '../../../data/models/response/product_response/ProductResponse.dart';
import '../../../domain/usecase/get_all_best_sellet_products_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

enum FilterType { all, category, occasion }

@injectable
class ProductViewModel extends BaseCubit {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllBestSellerProductsUseCase _getAllBestSellerProductsUseCase;
  final SharedPreferencesService _sharedPreferencesService;

  List<Products> _productList = [];
  List<BestSeller> _bestSellerProductList = [];

  ProductViewModel(this._getAllProductsUseCase, this._sharedPreferencesService,
      this._getAllBestSellerProductsUseCase);

  @override
  void start() => _fetchAllProducts();

  Future<void> _fetchAllProducts() async {
    emit(LoadingState());

    final cachedData = await _sharedPreferencesService.getCachedProducts();
    if (cachedData != null) {
      _productList = cachedData;
      emit(ContentState());
      return;
    }

    final result = await _getAllProductsUseCase.getAllProducts();
    if (result is Success<ProductResponse?>) {
      final response = result.data;
      if (response != null && response.products!.isNotEmpty) {
        _productList = response.products!;
        _sharedPreferencesService.cacheProducts(_productList);
        emit(ContentState());
      } else {
        emit(EmptyState(message: "No products found"));
      }
    } else if (result is Fail) {
      emit(ErrorState(result.toString()));
    }
  }

  List<Products> get getProducts => _productList;

  List<Products> getProductsByCategory(String categoryId) {
    return _productList
        .where((product) => product.category == categoryId)
        .toList();
  }

  List<Products> getProductsByOccasion(String occasionId) {
    return _productList
        .where((product) => product.occasion == occasionId)
        .toList();
  }

  List<Products> getProductsByFilter(String filterType, String id) {
    if (filterType == "all") {
      return _productList;
    } else if (filterType == "category") {
      return getProductsByCategory(id);
    } else if (filterType == "occasion") {
      return getProductsByOccasion(id);
    }
    return [];
  }

  Future<void> fetchBestSellerProducts() async {
    emit(LoadingState());

    // final cachedData =
    //     await _sharedPreferencesService.getCachedBestSellerProducts();
    // if (cachedData != null) {
    //   _bestSellerProductList = cachedData;
    //   emit(ContentState());
    //   return;
    // }

    final result = await _getAllBestSellerProductsUseCase.getAllProducts();
    if (result is Success<BestSellerProductResponse?>) {
      final response = result.data;
      if (response != null && response.bestSeller!.isNotEmpty) {
        _bestSellerProductList = response.bestSeller!;

        _sharedPreferencesService
            .cacheBestSellerProducts(_bestSellerProductList);

        emit(ContentState());
      } else {
        emit(EmptyState(message: StringsManager.noProductsFound.tr()));
      }
    } else if (result is Fail) {
      emit(ErrorState(result.toString()));
    }
  }

  List<BestSeller> get bestSellerProducts => _bestSellerProductList;
}
