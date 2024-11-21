import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/category_icon.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/section_header.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});

  CategoriesViewmodel viewModel = getIt.get<CategoriesViewmodel>();

  @override
  Widget build(BuildContext context) {
    _getAllCategories();
    return BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            SectionHeader(title: 'Categories', onpressed: () {}),
            BlocBuilder<CategoriesViewmodel, CategoriesState>(
              builder: (BuildContext context, CategoriesState state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  );
                }
                if (state is SuccessState) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CategoryIcon(category: state.categories![index]),
                      ),
                    ),
                  );
                }
                if (state is ErrorState) {
                  return Text(extractErrorMessage(state.exception));
                }
                return const Placeholder();
              },
            )
          ],
        ));
  }

  void _getAllCategories() {
    viewModel.doIntent(LoadCategoriesIntent());
  }
}
