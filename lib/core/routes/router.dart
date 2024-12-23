import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_view/register_view.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/update_password_view/update_password_view.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/check_out_view.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/best_seller_view.dart';
import 'package:elevate_ecommerce/features/home/presentation/mian_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/about_us/about_us_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/terms_and_conditions.dart/terms_and_conditions_screen.dart';
import 'package:elevate_ecommerce/features/orders/presentation/orders_screen.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_view/addressView.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/views/login_view.dart';
import '../../features/home/presentation/permission_screen/permission_view/permission_screen.dart';
import '../../features/home/presentation/profile_edit_screen/profile_edit_view/profile_edit_screen.dart';
import '../../features/home/presentation/profile_screen/save_address/save_address_view/save_address_view.dart';

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
      return MaterialPageRoute(builder: (context) => const ProfileEditScreen());
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
      return MaterialPageRoute(builder: (context) => const bestSeller_screen());
    case AppRoutes.saveAddressScreen:
      return MaterialPageRoute(builder: (context) => const SaveAddressScreen());
    case AppRoutes.permissionScreen:
      return MaterialPageRoute(builder: (_) => const PermissionsScreen());
    case AppRoutes.ResetPassword:
      return MaterialPageRoute(
          builder: (context) => const UpdatePasswordView());
    case AppRoutes.address:
      return MaterialPageRoute(builder: (context) => const AddressesScreen());
    case AppRoutes.termsAndConditions:
      return MaterialPageRoute(
        builder: (context) => const TermsAndConditionsScreen(),
      );
    case AppRoutes.aboutUs:
      return MaterialPageRoute(
        builder: (context) => const AboutUsScreen(),
      );
    case AppRoutes.checkOut:
      return MaterialPageRoute(
        builder: (context) => CheckOutView(),
      );
    case AppRoutes.orders:
      return MaterialPageRoute(
        builder: (context) => OrdersScreen(),
      );
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
