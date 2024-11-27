import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:injectable/injectable.dart';

import '../repositories/product_details_repository.dart';
@injectable
class ProductDetailsUsecase {
  final ProductDetailsRepository _productDetailsRepository;

  ProductDetailsUsecase(this._productDetailsRepository);

  Future<Result<ProductDetailsResponse?>> getProductDetails(String productId) async {
    return await _productDetailsRepository.getProductDetails(productId);
  }
}
