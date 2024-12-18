import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/cart_screen/cart_view/payment_details_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/widgets/address_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/widgets/delivery_time_widget.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/widgets/gift_toggle_formf.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/widgets/payment_method_screen.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressViewModel addressViewModel = getIt<AddressViewModel>();
    final CartViewmodel cartViewModel = getIt<CartViewmodel>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => addressViewModel..doIntent(LoadAddressIntent()),
        ),
        BlocProvider(
          create: (context) => cartViewModel..doIntent(LoadCartIntent()),
        ),
      ],
      child: Scaffold(
        appBar: customAppBar(title: 'Checkout'.tr()),
        body: BlocBuilder<CartViewmodel, CartState>(
          builder: (context, state) {
            int subtotal = 0;
            int total = 0;

            if (state is CartSuccessState && state.cartData != null) {
              final cartItems = state.cartData!.cartItems ?? [];
              subtotal = cartViewModel.cartSubtotal(cartItems);
              total = state.cartData!.totalPrice ?? 0;
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeliveryTimeWidget(
                    deliveryDate: DateTime.now().add(const Duration(days: 2)),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFEAEAEA),
                    height: 24,
                  ),
                  AddressSection(viewModel: addressViewModel),
                  SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFEAEAEA),
                    height: 24,
                  ),
                  const PaymentMethodScreen(),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFEAEAEA),
                    height: 24,
                  ),
                  const GiftToggleForm(),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFEAEAEA),
                    height: 24,
                  ),
                  SizedBox(height: 24),
                  PaymentDetailsSection(
                    subtotal: subtotal,
                    total: total,
                  ),
                  SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      onPressed: () {},
                      text: 'Place Order'.tr(),
                      radius: 20,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
