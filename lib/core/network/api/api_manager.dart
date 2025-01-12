// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_ecommerce/core/network/api/api_constants.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/add_cart_product_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/requests/update_cart_product_quantity_request.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response/cart_response.dart';
import 'package:elevate_ecommerce/features/Cart/data/models/responses/cart_response2/cart_response2.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/reset_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_categories_response/get_all_categories_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/home_response/home_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_request.dart';
import 'package:elevate_ecommerce/features/auth/update_password/data/model/updatePassword_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/get_all_occasions_response/get_all_occations_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:elevate_ecommerce/features/notifications/data/response/notificationResponse.dart';
import 'package:elevate_ecommerce/features/orders/data/models/response/order_response/order_response.dart';
import 'package:elevate_ecommerce/features/payment/data/models/create_order/create_order/create_order.dart';
import 'package:elevate_ecommerce/features/payment/data/models/payment/payment.dart';
import 'package:elevate_ecommerce/features/payment/data/models/request/payment/payment.request.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/models/response/addressResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import '../../../features/auth/login/data/models/request/login_request.dart';
import '../../../features/auth/login/data/models/response/login_response.dart';

import '../../../features/home/data/models/response/product_response/ProductResponse.dart';
import '../../providers/token_provider.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio, TokenProvider tokenProvider) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = tokenProvider.token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return _ApiManager(dio);
  }
  @POST(ApiConstants.registerPath)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @PATCH(ApiConstants.updatePasswordPath)
  Future<UpdatePasswordResponse> updatePassword(
    @Body() UpdatePasswordRequest request,
    @Header('Authorization') String authorization,
  );

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

  @GET(ApiConstants.allCategoriesPath)
  Future<GetAllCategoriesResponse?> getAllCategories();

  @GET(ApiConstants.homePagePath)
  Future<HomeResponse?> getHomePage();

  @GET("${ApiConstants.getAllProductsPath}{param}")
  Future<ProductResponse?> getAllProducts(@Path('param') String param);

  @GET(ApiConstants.getAllBestSellerProductsPath)
  Future<BestSellerProductResponse?> getAllBestSellerProducts();

  @GET("${ApiConstants.getProductDetailsPath}/{productId}")
  Future<ProductDetailsResponse?> getProductDetails(
      @Path("productId") String productId);
  @GET(ApiConstants.allOccasionsPath)
  Future<GetAllOccasionsResponse?> getAllOccasions();

  //cart endpoints
  @GET(ApiConstants.cartPath)
  @Extra({'requiresToken': true})
  Future<CartResponse?> getAllCart();

  @POST(ApiConstants.cartPath)
  @Extra({'requiresToken': true})
  Future<CartResponse2?> addProductToCart(@Body() AddCartProductRequest req);

  @PUT("${ApiConstants.cartPath}/{productId}")
  @Extra({'requiresToken': true})
  Future<CartResponse?> updateCartProductQuantity(
      @Path("productId") String productId,
      @Body() UpdateCartProductQuantityRequest req);

  @DELETE("${ApiConstants.cartPath}/{productId}")
  @Extra({'requiresToken': true})
  Future<CartResponse2?> removeItemFromCart(
      @Path("productId") String productId);
  @GET(ApiConstants.profilePath)
  Future<UserResponse?> getProfile(
      @Header('Authorization') String authorization);

  @PUT(ApiConstants.editProfilePath)
  Future<UserResponse?> updateProfileData(@Body() UpdateProfileRequest request);

  @GET(ApiConstants.logoutPath)
  Future<Logout?> logout(@Header('Authorization') String authorization);

  @PATCH(ApiConstants.addSaveAddressPath)
  Future<UserAddressResponse?> saveAddress(
    @Body() AddressRequest address,
  );

  @GET(ApiConstants.getAddressesPath)
  @Extra({'requiresToken': true})
  Future<AddressResponse?> getAddresses();

  @GET(ApiConstants.getNotificationsPath)
  @Extra({'requiresToken': true})
  Future<NotificationResponse?> getNotifications();

  @DELETE("${ApiConstants.removeNotificationPath}/{notificationId}")
  @Extra({'requiresToken': true})
  Future<NotificationResponse?>removeNotification(
      @Path("notificationId") String notificationId);

  @DELETE("${ApiConstants.removeAddressPath}/{addressId}")
  @Extra({'requiresToken': true})
  Future<AddressResponse?>removeAddress(
      @Path("addressId") String productId);

  @GET(ApiConstants.ordersPath)
  Future<OrderResponse?> getOrders();
  @POST(ApiConstants.paymentPath)
  @Extra({'requiresToken': true})
  Future<Payment?> doPayment(
    @Body() PaymentRequest paymentRequest,
  );
  @POST(ApiConstants.ordersPath)
  @Extra({'requiresToken': true})
  Future<CreateOrder?> createOrder(
    @Body() PaymentRequest paymentRequest,
  );
}
