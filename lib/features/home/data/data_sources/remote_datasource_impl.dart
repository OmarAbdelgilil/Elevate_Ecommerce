import 'package:elevate_ecommerce/core/network/api/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../contracts/remote_datasource.dart';

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  ApiManager apiManager;
  RemoteDatasourceImpl(this.apiManager);
}
