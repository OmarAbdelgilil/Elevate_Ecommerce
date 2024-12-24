import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/best_seller_section/best_seller_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/categories_section/categories_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/home_app_bar.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/location.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/occasions_section/occasion_section.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenViewmodel viewModel = getIt.get<HomeScreenViewmodel>();

  @override
  Widget build(BuildContext context) {
    final saveAddressViewModel = getIt.get<SaveAddressViewModel>();
    saveAddressViewModel.permissionsPermitted();
    _loadHomePage();
   return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => viewModel),
        BlocProvider(create: (context) => saveAddressViewModel),
      ],
      child: Scaffold(
        appBar: homeAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
               const Location(),
                const SizedBox(
                  height: 10,
                ),
                CategoriesSection(),
                BlocBuilder<HomeScreenViewmodel, HomeState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Column(
                        children: [
                          BestSellerSection(
                            loading: true,
                          ),
                          OccasionSection(
                            loading: true,
                          )
                        ],
                      );
                    }
                    if (state is SuccessState) {
                      return Column(
                        children: [
                          BestSellerSection(
                            bestsellerList: state.homeData!.bestSeller,
                          ),
                          OccasionSection(
                            occasionList: state.homeData!.occasions,
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     final userProvider = getIt<UserProvider>();

                          //     final userData = userProvider.userData;

                          //     if (userData != null) {
                          //       print('User Data: ${userData.toJson()}');
                          //     } else {
                          //       print('No user data available.');
                          //     }
                          //   },
                          //   child: Text('Print User Data'),
                          // ),
                          // ElevatedButton(
                          //     onPressed: () async {
                          //       final token = TokenProvider().token;
                          //       final HiveService hiveService = HiveService();
                          //       try {
                          //         final user =
                          //             await hiveService.getUser(token!);
                          //         if (user != null) {
                          //           print('Cached user data: ${user.toJson()}');
                          //         } else {
                          //           print(
                          //               'No user data found in Hive. Ensure keys and box names match.');
                          //         }
                          //       } catch (e) {
                          //         print(
                          //             'Error retrieving user data from Hive: $e');
                          //       }
                          //     },
                          //     child: Text('data')),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       print(TokenProvider().token);
                          //     },
                          //     child: Text('print token'))
                        ],
                      );
                    }
                    if (state is ErrorState) {
                      return Column(
                        children: [
                          BestSellerSection(
                            exception: state.exception,
                          ),
                          OccasionSection(
                            exception: state.exception,
                          ),
                        ],
                      );
                    }

                    return const Placeholder();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loadHomePage() {
    viewModel.doIntent(LoadHomeIntent());
  }
}



