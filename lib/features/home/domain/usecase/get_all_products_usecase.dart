import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/domain/models/user.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repository.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepository _homeRepository;

  GetAllProductsUseCase(this._homeRepository);

  Future<Result<ProductResponse?>> getAllProducts() async {
    return await _homeRepository.getAllProducts();
  }


}
