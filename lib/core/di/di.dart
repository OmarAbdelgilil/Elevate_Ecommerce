import 'package:elevate_ecommerce/features/home/domain/repositories/product_details_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../network/services/shared_preferences_service.dart';
import 'di.config.dart';

final getIt = GetIt.instance;


@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
