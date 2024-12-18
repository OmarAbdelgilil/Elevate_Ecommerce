import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';

import '../../../auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import '../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../../data/models/request/address_request/address_request.dart';

abstract class HomeRepository {
  Future<Result<Categories?>> getAllCategories();
  Future<Result<Home?>> getHomePage();

  Future<Result<ProductResponse?>> getAllProducts();

  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts();

  Future<Result<Occasions?>> getAllOccasions();
  Future<Result<UserResponse?>> upDateUserProfile(UpdateProfileRequest request);

  Future<Result<UserAddressResponse?>> saveUserAddress(AddressRequest request);

}
