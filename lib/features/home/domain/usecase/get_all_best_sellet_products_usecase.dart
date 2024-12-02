import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repository.dart';

@injectable
class GetAllBestSellerProductsUseCase {
  final HomeRepository _homeRepository;

  GetAllBestSellerProductsUseCase(this._homeRepository);

  Future<Result<BestSellerProductResponse?>> getAllProducts() async {
    return await _homeRepository.getAllBestSellerProducts();
  }
}
