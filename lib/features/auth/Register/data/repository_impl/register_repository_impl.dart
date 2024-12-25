import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/dataSource/register_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/repository/register_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterOnlineDatasource _registerOnlineDatasource;

  RegisterRepositoryImpl(
    this._registerOnlineDatasource,
  );

  @override
  Future<Result<RegisterResponse?>> register(RegisterRequest request) async {
    return await _registerOnlineDatasource.register(request);
  }
}
