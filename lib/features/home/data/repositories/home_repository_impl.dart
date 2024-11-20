import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:injectable/injectable.dart';

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
}
