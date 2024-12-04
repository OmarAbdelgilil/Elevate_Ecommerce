import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/categry_viewmodel.dart';
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
                      itemBuilder: (context, index) {
                        final category = state.categories![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryScreen(
                                    selectedCategoryId: category.id!,
                                  ),
                                ),
                              );
                            },
                            child: CategoryIcon(category: category),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is ErrorState) {
                  return Text(extractErrorMessage(state.exception));
                }
                return const Placeholder();
              },
            ),
          ],
        ));
  }

  void _getAllCategories() {
    viewModel.doIntent(LoadCategoriesIntent());
  }
}
