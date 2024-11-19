import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';
import '../contracts/remote_datasource.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final RemoteDatasource _homeDatasource;

  HomeRepositoryImpl(this._homeDatasource);
}
