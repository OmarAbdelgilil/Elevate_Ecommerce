import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/cart_screen/cart_view/cart_item_card.dart';
import 'package:elevate_ecommerce/features/home/presentation/cart_screen/cart_view/payment_details_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/check_out_view.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/location.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewmodel viewModel = getIt<CartViewmodel>();
    return BlocProvider(
      create: (context) => viewModel..doIntent(LoadCartIntent()),
      child: BlocBuilder<CartViewmodel, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text(
                    StringsManager.cartTitle.tr(),
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  if (state is CartSuccessState)
                    Text(
                      '(${state.cartData!.numOfCartItems} ${StringsManager.items.tr()})',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(139, 0, 0, 0)),
                    )
                ],
              ),
            ),
            body: state is CartLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  )
                : state is CartErrorState
                    ? Center(
                        child: Text(extractErrorMessage(state.exception)),
                      )
                    : state is CartSuccessState
                        ? state.cartData!.cartItems!.isEmpty
                            ? Center(
                                child: Text('Cart is Empty'),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        Location(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: SizedBox(
                                            height: 400.sp,
                                            width: double.infinity,
                                            child: ListView.builder(
                                              itemCount: state
                                                  .cartData!.cartItems!.length,
                                              itemBuilder: (context, index) {
                                                return CartItemCard(
                                                    viewModel: viewModel,
                                                    product: state.cartData!
                                                        .cartItems![index]);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PaymentDetailsSection(
                                      subtotal: viewModel.cartSubtotal(
                                          state.cartData!.cartItems!),
                                      total: state.cartData!.totalPrice! + 10),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: CustomButton(
                                      onPressed: () {
                                        final now = DateTime.now();
                                        final deliveryDate =
                                            now.add(const Duration(days: 2));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CheckOutView(
                                                deliveryDate: deliveryDate),
                                          ),
                                        );
                                      },
                                      text: StringsManager.checkoutButtonText
                                          .tr(),
                                      radius: 20,
                                    ),
                                  )
                                ],
                              )
                        : state is CartNotLoggedState
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomButton(
                                    text: StringsManager.loginButton.tr(),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.login);
                                    },
                                  ),
                                ),
                              )
                            : Placeholder(),
          );
        },
      ),
    );
  }
}
