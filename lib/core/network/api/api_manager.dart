// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_ecommerce/core/network/api/api_constants.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/auth/login/data/models/request/login_request.dart';
import '../../../features/auth/login/data/models/response/login_response.dart';

import '../../../features/home/data/models/response/product_response/ProductResponse.dart';

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

  @POST(ApiConstants.loginPath)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(ApiConstants.forgotPasswordPath)
  Future<ForgotPasswordResponse> forgotPassword(
      @Body() ForgotPasswordRequest request);

  @POST(ApiConstants.verifyResetCodePath)
  Future<VerifyPasswordResponse> verifyResetPassword(
      @Body() VerifyPasswordRequest request);

  @PUT(ApiConstants.resetPasswordPath)
  Future<ResetPasswordResponse?> resetPassword(
      @Body() ResetPasswordRequest request);


  @GET(ApiConstants.getAllProductsPath)
  Future<ProductResponse?> getAllProducts();


  @GET(ApiConstants.getAllBestSellerProductsPath)
  Future<BestSellerProductResponse?> getAllBestSellerProducts();

  @GET("${ApiConstants.getProductDetailsPath}/{productId}")
  Future<ProductDetailsResponse?> getProductDetails(@Path("productId") String productId);
}
