import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final RemoteDatasource _homeDatasource;

  HomeRepositoryImpl(this._homeDatasource);

  @override
  Future<Result<ProductResponse?>> getAllProducts() async {
    return await _homeDatasource.getAllProducts();
  }
}
