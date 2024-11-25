import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  final PageController _pageController = PageController();
   ProductsModel productDetails ;
   ProductDetails_ViewModel productDetailsViewModel = getIt<ProductDetails_ViewModel>();

  ProductDetailsScreen({required this.productId, Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productDetailsViewModel.doIntent(LoadProductDetailsIntent(productId));

    return Scaffold(
      body: BlocBuilder<ProductDetails_ViewModel, ProductDetailsState>(
        bloc: productDetailsViewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator(color: primaryColor,));
          }  if (state is SuccessState) {
             productDetails = state.productDetails;

            if (productDetails == null) {
              return const Center(child: Text("No product details available."));
            }

            return CustomScrollView(
              slivers: [

                SliverAppBar(
                  backgroundColor: primaryColor,
                  expandedHeight: 500.h,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(bottom: 25.h, left: 10.w),
                    title: Text(
                      productDetails.title ?? '',
                      style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    background: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: _pageController,
                                itemCount: productDetails.images?.length ?? 0,
                                itemBuilder: (context, index) {



                                  return CachedNetworkImage (
                                    imageUrl: productDetails.images![index],
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              if (productDetails.images != null)
                                Positioned(
                                  bottom: 10.h,
                                  right: MediaQuery.of(context).size.width * 0.40,
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: productDetails.images!.length,
                                    effect: ExpandingDotsEffect(
                                      activeDotColor: primaryColor,
                                      dotColor: Colors.white,
                                      dotHeight: 9,
                                      dotWidth: 9,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EGP ${productDetails.priceAfterDiscount ?? productDetails.price}',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              'All prices include tax',
                              style: TextStyle(
                                color: gray53Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                              ),
                            ),
                            Text(
                              'Status: ${productDetails.quantity! > 0 ? "In stock" : "Out of stock"}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          productDetails.description ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Bouquet includes',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Pink roses: 20\nWhite wrap',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 35.h),

                        // Add to cart button
                        CustomButton(
                          text: 'Add to cart',
                          onPressed: () {
                            // Handle add to cart action
                          },
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                "Failed to load product details: ${state.exception?.toString() ?? "Unknown error"}",
              ),
            );
          }

          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}









