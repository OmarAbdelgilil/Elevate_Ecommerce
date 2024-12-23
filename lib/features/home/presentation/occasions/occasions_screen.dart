import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_widgets.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_viewmodel.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view/product_screen.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsScreen extends StatelessWidget {
  final String selectedOccasionId;

  const OccasionsScreen({super.key, required this.selectedOccasionId});

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
              final selectedIndex = occasions
                  .indexWhere((occasion) => occasion.id == selectedOccasionId);

              return DefaultTabController(
                length: occasions.length + 1,
                initialIndex: selectedIndex >= 0 ? selectedIndex + 1 : 0,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          customAppBar(title: StringsManager.occasions.tr()),
                          TabBar(
                            dividerHeight: 0,
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
                          ProductScreen(filterType: 'all', id: ''),
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
