import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/product_details_onlinedatasource.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/product_details_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepository)
class ProductDetailsRepoImpl implements ProductDetailsRepository {
  final ProductDetailsOnlinedatasource _productDetailsOnlinedatasource;

  ProductDetailsRepoImpl(this._productDetailsOnlinedatasource);

  @override
  Future<Result<ProductDetailsResponse?>> getProductDetails(
      String productId) async {
    return await _productDetailsOnlinedatasource.getProductDetails(productId);
  }
}
