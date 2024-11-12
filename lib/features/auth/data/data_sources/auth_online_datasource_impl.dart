import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:elevate_ecommerce/features/auth/data/contracts/auth_online_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;
  AuthOnlineDatasourceImpl(this.apiManager);
}
