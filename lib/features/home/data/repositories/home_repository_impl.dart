import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/logged_user_data/data/models/user_response/user_response.dart';
import '../../domain/repositories/home_repository.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final RemoteDatasource _homeDatasource;

  HomeRepositoryImpl(this._homeDatasource);

  @override
  Future<Result<Categories?>> getAllCategories() async {
    final result = await _homeDatasource.getAllCategories();
    return result;
  }

  @override
  Future<Result<Home?>> getHomePage() async {
    final result = await _homeDatasource.getHomePage();
    return result;
  }

  @override
  Future<Result<ProductResponse?>> getAllProducts() async {
    return await _homeDatasource.getAllProducts();
  }

  @override
  Future<Result<BestSellerProductResponse?>> getAllBestSellerProducts() async {
    return await _homeDatasource.getAllBestSellerProducts();
  }

  @override
  Future<Result<Occasions?>> getAllOccasions() async {
    final result = await _homeDatasource.getAllOccasions();
    return result;
  }

  @override
  Future<Result<UserResponse?>> upDateUserProfile(UpdateProfileRequest request) async{
    final result = await _homeDatasource.upDateUserProfile(request);
    return result;
  }
}
