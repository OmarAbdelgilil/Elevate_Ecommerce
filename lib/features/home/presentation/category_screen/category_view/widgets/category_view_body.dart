import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/home/data/products_filters_enum.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_widgets.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/search_result_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/filters/filters.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/search_text_field.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/product_screen.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/categry_viewmodel.dart';
import 'package:flutter_svg/svg.dart';

class CategoryScreen extends StatefulWidget {
  final String selectedCategoryId;

  const CategoryScreen({super.key, required this.selectedCategoryId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ProductsFiltersEnum? filter;
  int? minPrice;
  int? maxPrice;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<CategoriesViewmodel>()..doIntent(LoadCategoriesIntent()),
      child: Scaffold(
        appBar:
            customAppBar(title: StringsManager.categoriesSectionHeader.tr()),
        body: BlocBuilder<CategoriesViewmodel, CategoriesState>(
          builder: (context, state) {
            if (state is SuccessState) {
              final categories = state.categories!;
              final selectedIndex = categories.indexWhere(
                  (category) => category.id == widget.selectedCategoryId);

              return DefaultTabController(
                length: categories.length + 1,
                initialIndex: selectedIndex >= 0 ? selectedIndex + 1 : 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.s16, vertical: AppSize.s8),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchScreen(),
                                        ));
                                  },
                                  child: AbsorbPointer(
                                      child: const SearchTextField()))),
                          const SizedBox(width: AppSize.s8),
                          SizedBox(
                            width: AppSize.s64,
                            height: 48.0,
                            child: InkWell(
                              onTap: () async {
                                final result = await showFilters(context,
                                    filter: filter,
                                    priceFrom: minPrice,
                                    priceTo: maxPrice);
                                if (result != null) {
                                  setState(() {
                                    filter = result['sortOption'];
                                    minPrice = result['priceRange'][0].toInt();
                                    maxPrice = result['priceRange'][1].toInt();
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
                                  border: Border.all(
                                    width: AppSize.s1_6,
                                    color: ColorManager.lightGrey,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppSize.s18,
                                      horizontal: AppSize.s23),
                                  child: SvgPicture.asset(
                                    SVGAssets.filterIcon,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      dividerHeight: 0,
                      isScrollable: true,
                      indicatorColor: ColorManager.primary,
                      labelColor: ColorManager.primary,
                      tabs: [
                        Tab(text: StringsManager.all.tr()),
                        ...categories
                            .map((category) => Tab(text: category.name)),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ProductScreen(
                            key: ValueKey(
                                '${filter ?? 'dd'}-${minPrice ?? ''}-${maxPrice ?? 'oo'}'),
                            filterType: "all",
                            id: "",
                            filter: filter,
                            priceFrom: minPrice,
                            priceTo: maxPrice,
                          ),
                          ...categories.map(
                            (category) => ProductScreen(
                              key: ValueKey(
                                  '${category.id!}-${filter ?? 'dd'}-${minPrice ?? ''}-${maxPrice ?? 'oo'}'),
                              filter: filter,
                              priceFrom: minPrice,
                              priceTo: maxPrice,
                              filterType: "category",
                              id: category.id!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(extractErrorMessage(state.exception)),
              );
            } else {
              return Center(
                  child: BaseWidgets.buildAnimatedImage(LottieAssets.loading));
            }
          },
        ),
      ),
    );
  }
}
