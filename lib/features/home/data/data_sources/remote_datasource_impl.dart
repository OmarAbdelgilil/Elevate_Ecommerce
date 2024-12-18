import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';

import 'package:elevate_ecommerce/features/home/data/Dtos/categories_dto.dart';
import 'package:elevate_ecommerce/features/home/data/Dtos/home_dto.dart';
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/Dtos/occasions_dto.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  ApiManager apiManager;
  RemoteDatasourceImpl(this.apiManager);

  @override
  Future<Result<Categories?>> getAllCategories() {
    return executeApi(() async {
      var result = await apiManager.getAllCategories();
      var categories = result?.categories;
      var categoriesDto = CategoriesDto(categories: categories!);
      return categoriesDto.toCategories();
    });
  }

  @override
  Future<Result<Home?>> getHomePage() {
    return executeApi(() async {
      var result = await apiManager.getHomePage();
      var bestSellers = result?.bestSeller;
      var occasions = result?.occasions;
      var products = result?.products;
      var homeDto = HomeDto(
          bestSellers: bestSellers!,
          occassions: occasions!,
          products: products!);
      return homeDto.toHome();
    });
  }

  @override
  Future<Result<ProductResponse?>> getAllProducts() async {
    return executeApi(() async {
      final result = await apiManager.getAllProducts();
      return result;
    });
  }

  @override
  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts() {
    return executeApi(() async {
      var result = await apiManager.getAllBestSellerProducts();
      return result;
    });
  }

  @override
  Future<Result<Occasions?>> getAllOccasions() {
    return executeApi(() async {
      var result = await apiManager.getAllOccasions();
      var occasions = result?.occasions;
      var ocaasionsDto = OccasionsDto(occations: occasions!);
      return ocaasionsDto.toOccasions();
    });
  }

  @override
  Future<Result<UserResponse?>> upDateUserProfile(
      UpdateProfileRequest request) {
    return executeApi(() async {
      var result = await apiManager.updateProfileData(request);
      return result;
    });
  }

  @override
  Future<Result<UserAddressResponse?>> saveAddress(AddressRequest request) {
    return executeApi(() async {
      var result = await apiManager.saveAddress(request);
      return result;
    });
  }
}
