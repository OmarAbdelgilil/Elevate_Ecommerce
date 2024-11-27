import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/cubit_builder.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_screen_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bestSeller_screen extends StatelessWidget {
  const bestSeller_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best seller",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: blackFontColor),
          ),
          Text(
            "Bloom with our exquisite best sellers",
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: blackFontColor),
          ),
        ],
      )),
      body: BlocProvider<ProductViewModel>(
        create: (context) =>
            getIt.get<ProductViewModel>()..fetchBestSellerProducts(),
        child: BlocBuilder<ProductViewModel, BaseState>(
          builder: (context, state) {
            return baseBuilder(
              context,
              state,
              Builder(
                builder: (context) {
                  final viewModel = context.read<ProductViewModel>();
                  final filteredProducts = viewModel.bestSellerProducts
                      .map(
                        (e) => ProductsModel(
                            category: e.category,
                            createdAt: e.category,
                            description: e.description,
                            id: e.id,
                            images: e.images,
                            imgCover: e.imgCover,
                            occasion: e.occasion,
                            price: e.price,
                            priceAfterDiscount: e.priceAfterDiscount,
                            quantity: e.quantity,
                            slug: e.slug,
                            title: e.title,
                            updatedAt: e.updatedAt,
                            v: e.v),
                      )
                      .toList();
                  return ProductScreenBody(products: filteredProducts);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
