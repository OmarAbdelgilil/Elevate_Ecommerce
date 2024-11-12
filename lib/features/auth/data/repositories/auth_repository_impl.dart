// ignore_for_file: unused_field

import 'package:elevate_ecommerce/features/auth/data/contracts/auth_offline_datasource.dart';
import 'package:elevate_ecommerce/features/auth/data/contracts/auth_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDatasource _authOnlineDatasource;
  final AuthOfflineDatasource _authOfflineDatasource;

  AuthRepositoryImpl(this._authOnlineDatasource, this._authOfflineDatasource);
}
