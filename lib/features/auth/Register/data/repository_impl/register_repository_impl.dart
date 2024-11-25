import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/dataSource/register_onlineDataSource.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/repository/register_repository.dart';
import 'package:elevate_ecommerce/features/auth/user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterOnlineDatasource _registerOnlineDatasource;


  RegisterRepositoryImpl(this._registerOnlineDatasource,);

  @override
  Future<Result<User?>> register(RegisterRequest request) async{
    return await _registerOnlineDatasource.register(request);

  }
}