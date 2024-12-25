import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/category_view/widgets/search_text_field.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_view/product_details_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/widgets/product_card.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_cubit.dart';

class SearchResultsScreen extends StatelessWidget {
  final String keyword;

  const SearchResultsScreen({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int columns = screenWidth > AppSize.s600 ? 3 : 2;
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<GetAllProductsUseCase>())
        ..doIntent(LoadSearchResultsIntent(keyword)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is ErrorState) {
              return Center(
                  child:
                      Text(state.exception?.toString() ?? 'An error occurred'));
            }

            if (state is SuccessState) {
              final products = state.products;
              if (products == null || products.isEmpty) {
                return Center(child: Text('No products found'));
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 16 / 25.5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: products[index].toModel(),
                              productId: products[index].id!,
                            ),
                          ));
                    },
                    child: ProductGridItem(
                      productImage: products[index].imgCover!,
                      title: products[index].title!,
                      description: products[index].description!,
                      price: products[index].price!,
                      priceAfterDiscount: products[index].priceAfterDiscount!,
                      id: products[index].id!,
                      disCount: '',
                    ),
                  );
                },
              );
            }

            return Center(child: Text('Unexpected state'));
          },
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void performSearch(String keyword) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(keyword: keyword),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchTextField(onSearchSubmitted: performSearch),
      )),
    );
  }
}
