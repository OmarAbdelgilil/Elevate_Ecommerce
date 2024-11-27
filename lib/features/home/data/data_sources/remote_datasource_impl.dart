import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api/api_execution.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  ApiManager apiManager;
  RemoteDatasourceImpl(this.apiManager);



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
}