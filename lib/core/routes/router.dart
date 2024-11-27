import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_view/register_view.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/mian_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/product_screen.dart';
import 'package:flutter/material.dart';


import '../../features/auth/login/presentation/views/login_view.dart';
final dummyProduct = ProductsModel(
    id: '1',
    title: 'Test Product',
    price: 100,
    description: "llll",
    images: ["kkkk","kkkkkk"],
    quantity: 900,
    priceAfterDiscount: 90

);
Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());

    case AppRoutes.productWidget:
      return MaterialPageRoute(builder: (context) => const ProductScreen());

    case AppRoutes.ProductDetails:
       return MaterialPageRoute(builder: (context)=>  ProductDetailsScreen(productId: "673e2e1f1159920171828153",product: dummyProduct,));
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
