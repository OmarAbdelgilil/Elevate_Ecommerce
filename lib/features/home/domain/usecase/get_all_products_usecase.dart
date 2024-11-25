import 'package:elevate_ecommerce/core/common/api_result.dart';
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
