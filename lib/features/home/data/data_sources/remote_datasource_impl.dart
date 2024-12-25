import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_execution.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import 'package:elevate_ecommerce/features/home/data/DTOs/home_dto.dart';

import 'package:elevate_ecommerce/features/home/data/Dtos/categories_dto.dart';

import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/user_address_response.dart';
import 'package:elevate_ecommerce/features/home/data/products_filters_enum.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/Dtos/occasions_dto.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/best_seller_productresponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/product_response.dart';
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
  Future<Result<ProductResponse?>> getAllProducts(
      {ProductsFiltersEnum? filter, int? priceFrom, int? priceTo}) async {
    return executeApi(() async {
      String? filterPath = '?';
      switch (filter) {
        case null:
          break;
        case ProductsFiltersEnum.lowestPrice:
          filterPath += 'sort=priceAfterDiscount';
          break;
        case ProductsFiltersEnum.highestPrice:
          filterPath += 'sort=-priceAfterDiscount';
          break;
        case ProductsFiltersEnum.newProducts:
          filterPath += 'sort=-createdAt';
          break;
        case ProductsFiltersEnum.oldProducts:
          filterPath += 'sort=createdAt';
          break;
        case ProductsFiltersEnum.discount:
          filterPath += 'discount[gt]=0';
          break;
      }
      if (priceFrom != null && priceTo != null) {
        if (filterPath != '?') {
          filterPath += '&';
        }
        filterPath +=
            "priceAfterDiscount[gte]=${priceFrom.toString()}&priceAfterDiscount[lte]=${priceTo.toString()}";
      }
      final result = await apiManager.getAllProducts(filterPath);
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
