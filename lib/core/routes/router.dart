import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_view/register_view.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/update_password_view/update_password_view.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/best_seller_view.dart';
import 'package:elevate_ecommerce/features/home/presentation/mian_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/savedAddresses_view/testtt.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_screen.dart';

final dummyProduct = ProductsModel(
    id: '1',
    title: 'Test Product',
    price: 100,
    description: "llll",
    images: ["kkkk", "kkkkkk"],
    quantity: 900,
    priceAfterDiscount: 90);
Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case AppRoutes.Categories:
      return MaterialPageRoute(
          builder: (context) => const CategoryScreen(
                selectedCategoryId: '',
              ));
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
    case AppRoutes.editProfile:
      return MaterialPageRoute(builder: (context) =>  ProfileEditScreen());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case AppRoutes.occasions:
      return MaterialPageRoute(
          builder: (context) => const OccasionsScreen(
                selectedOccasionId: '',
              ));

    case AppRoutes.ProductDetails:
      return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
                productId: "673e2e1f1159920171828153",
                product: dummyProduct,
              ));
    case AppRoutes.bestSeller:
       return MaterialPageRoute(builder: (context)=>  ProductDetailsScreen(productId: "673e2e1f1159920171828153",product: dummyProduct,));
       case AppRoutes.bestSeller:
      return MaterialPageRoute(builder: (context) => const bestSeller_screen());
    case AppRoutes.ResetPassword:
      return MaterialPageRoute(builder: (context)=>  UpdatePasswordView());
    case AppRoutes.tessstt:
      return MaterialPageRoute(builder: (context)=>  tessstt());
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
