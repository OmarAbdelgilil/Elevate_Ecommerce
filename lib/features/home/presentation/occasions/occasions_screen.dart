import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_widgets.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_viewmodel.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/product_screen.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsScreen extends StatelessWidget {
  const OccasionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<OccasionsViewmodel>()..doIntent(LoadOccationsIntent()),
      child: Scaffold(
        body: BlocBuilder<OccasionsViewmodel, OccasionsState>(
          builder: (context, state) {
            if (state is SuccessOccasionsState) {
              final occasions = state.occasions!;
              return DefaultTabController(
                length: occasions.length + 1,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          customAppBar(title: 'Occasions'),
                          TabBar(
                            isScrollable: true,
                            indicatorColor: ColorManager.primary,
                            labelColor: ColorManager.primary,
                            labelStyle: TextStyle(fontSize: AppSize.s16),
                            unselectedLabelStyle:
                                TextStyle(fontSize: AppSize.s16),
                            tabs: [
                              const Tab(text: "All"),
                              ...occasions.map(
                                (occasion) => Tab(text: occasion.name),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        children: [
                          const ProductScreen(filterType: 'all', id: ''),
                          ...occasions.map(
                            (occasion) => ProductScreen(
                              filterType: 'occasion',
                              id: occasion.id!,
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
                child: Text('Error: ${state.exception}'),
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
