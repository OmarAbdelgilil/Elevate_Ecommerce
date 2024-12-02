import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../product_view_model/product_view_model.dart';

class ProductScreen extends StatelessWidget {
  final String filterType;
  final String id;

  const ProductScreen({required this.filterType, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductViewModel>(
      create: (context) => getIt.get<ProductViewModel>()..start(),
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
                final filteredProducts = viewModel
                    .getProductsByFilter(filterType, id)
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
    );
  }
}
