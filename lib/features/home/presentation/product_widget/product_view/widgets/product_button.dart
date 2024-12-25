import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/color_manager.dart';

class ProductButton extends StatelessWidget {
  final String productId;
  const ProductButton({super.key, required this.text, required this.productId});
  final Widget text;

  @override
  Widget build(BuildContext context) {
    final CartViewmodel cartViewmodel = getIt<CartViewmodel>();
    return BlocBuilder<CartViewmodel, CartState>(
      bloc: cartViewmodel,
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          onPressed: () {
            cartViewmodel
                .doIntent(AddProductIntent(productId: productId, quantity: 1));
          },
          child: text,
        );
      },
    );
  }
}
