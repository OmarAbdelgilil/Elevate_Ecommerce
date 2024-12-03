import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetLoggedUserDataRepo)
class GetLoggedUserDataRepoImpl implements GetLoggedUserDataRepo {
  final GetLoggedUserDataOnlineDatasource _getLoggedUserDataOnlineDatasource;

  GetLoggedUserDataRepoImpl(this._getLoggedUserDataOnlineDatasource);
  @override
  Future<Result<UserResponse?>> getLoggedUserData() {
    return _getLoggedUserDataOnlineDatasource.getLoggedUserData();
  }
}
