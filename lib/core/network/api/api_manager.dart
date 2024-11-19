// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_ecommerce/core/network/api/api_constants.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) {
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _ApiManager(dio);
  }
  @POST(ApiConstants.registerPath)
  Future<RegisterResponse> register(
      @Body() RegisterRequest request);
}
