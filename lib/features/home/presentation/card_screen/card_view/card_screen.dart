import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../utils/color_manager.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../product_widget/product_view/widgets/product_screen_body.dart';
import '../../product_widget/product_view_model/product_view_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductViewModel>(
      create: (context) => getIt.get<ProductViewModel>()..fetchBestSellerProducts(),
      child: BlocConsumer<ProductViewModel, BaseState>(
        listener: (context, state) {
          baseListener(context, state);
        },
        builder: (context, state) {
          return baseBuilder(
            context,
            state,
            Builder(
              builder: (context) {
                final viewModel = context.read<ProductViewModel>();
                final filteredProducts = viewModel.bestSellerProducts;



                return ProductScreenBody(products: filteredProducts.map((e) => Products(
                  id: e.id,
                  title: e.title,
                  price: e.price,
description: e.description,
                  imgCover: e.imgCover,

                )).toList());
              },
            ),
          );
        },
      ),
    );
  }
}
