import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/category_view_body.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/categories_section/category_icon.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/section_header.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionHeader(
                title: StringsManager.categoriesSectionHeader.tr(),
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const CategoryScreen(selectedCategoryId: ''),
                  ));
                }),
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
                    height: 100.h,
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
                  return Center(
                      child: Text(StringsManager.categoriesSectionError.tr()));
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
