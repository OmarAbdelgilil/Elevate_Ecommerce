import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/Cart/presentation/viewmodel/cart_view_model.dart';
import 'package:elevate_ecommerce/features/home/domain/models/product_model.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  final ProductsModel product;

  const ProductDetailsScreen({
    required this.productId,
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetails_ViewModel productDetailsViewModel =
      getIt<ProductDetails_ViewModel>();
  final CartViewmodel cartViewmodel = getIt<CartViewmodel>();
  final PageController _pageController = PageController();
  late ProductsModel productDetails;

  @override
  void initState() {
    super.initState();
    productDetails = widget.product;
    productDetailsViewModel
        .doIntent(LoadProductDetailsIntent(widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProductDetails_ViewModel, ProductDetailsState>(
        bloc: productDetailsViewModel,
        listener: (context, state) {
          if (state is SuccessState) {
            setState(() {
              productDetails = state.productDetails;
            });
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      "Failed to refresh product details: ${state.exception?.toString() ?? "Unknown error"}")),
            );
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: primaryColor,
              expandedHeight: 500.h,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 25.h, left: 10.w),
                title: Text(productDetails.title ?? '',
                    style: AppTextStyles.title(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                background: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: productDetails.images?.length ?? 0,
                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
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

            // Product Details
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EGP ${productDetails.priceAfterDiscount ?? productDetails.price}',
                      style: AppTextStyles.subtitle(
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
                          style: AppTextStyles.subtitle(
                            color: gray53Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          'Status: ${productDetails.quantity! > 0 ? "In stock" : "Out of stock"}',
                          style: AppTextStyles.subtitle(
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
                      style: AppTextStyles.subtitle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      productDetails.description ?? '',
                      style: AppTextStyles.subtitle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Bouquet includes',
                      style: AppTextStyles.subtitle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Pink roses: 20\nWhite wrap',
                      style: AppTextStyles.subtitle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 35.h),

                    // Add to cart button
                    BlocBuilder<CartViewmodel, CartState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primary,
                            ),
                          );
                        }
                        return CustomButton(
                          text: 'Add to cart',
                          onPressed: () {
                            cartViewmodel.doIntent(AddProductIntent(
                                productId: productDetails.id!, quantity: 1));
                          },
                        );
                      },
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
