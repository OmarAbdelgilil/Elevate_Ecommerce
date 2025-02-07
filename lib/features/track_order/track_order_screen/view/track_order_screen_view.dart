import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/providers/user_provider.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/data_intent/data_intent.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../utils/assets_manager.dart';
import '../view_model/track_oder_view_model.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;

  const TrackOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = OrderViewModel();
        viewModel.listenToOrder(orderId);
        return viewModel;
      },
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.trackOrder.tr()),
        body: Consumer<OrderViewModel>(
          builder: (context, orderViewModel, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimated arrival',
                      style: AppTextStyles.title(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.darkGrey),
                    ),
                    Text(
                      orderViewModel.steps.last["timestamp"] ?? "N/A",
                      style: AppTextStyles.title(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black),
                    ),
                    const Divider(),
                    ListTile(
                      leading: SvgPicture.asset(SVGAssets.boy),
                      title: Text(orderViewModel.driverName.isNotEmpty
                          ? orderViewModel.driverName
                          : "Fetching..."), // ✅ Display Driver's First Name
                      subtitle: const Text('Is your delivery hero for today'),
                      trailing: FittedBox(
                        child: Row(
                          children: [
                            SvgPicture.asset(SVGAssets.call),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                orderViewModel.navigateToChatPage(context, userProvider.userData?.id??'', DataIntent.getDriverId());

                              },
                              child: SvgPicture.asset(SVGAssets.whatsApp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        ImageAssets.car,
                        width: 500.w,
                        height: 90.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        AnotherStepper(
                          stepperList:
                          orderViewModel.steps.asMap().entries.map((entry) {
                            int index = entry.key;
                            Map<String, String> step = entry.value;

                            return StepperData(
                              title: StepperText(
                                step["title"]!,
                                textStyle: AppTextStyles.title(
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: StepperText(
                                step["timestamp"]!.isNotEmpty
                                    ? step["timestamp"]!
                                    : "Pending...",
                                textStyle:
                                AppTextStyles.subtitle(fontSize: 15.sp),
                              ),
                              iconWidget: Icon(
                                Icons.radio_button_checked,
                                color: index <= orderViewModel.currentStep
                                    ? ColorManager.primary
                                    : ColorManager.lightGrey,
                              ),
                            );
                          }).toList(),
                          stepperDirection: Axis.vertical,
                          activeIndex: orderViewModel.currentStep,
                          barThickness: 2,
                          inverted: false,
                          activeBarColor: ColorManager.primary,
                        ),
                        if (orderViewModel.currentStep >= 3) ...[
                          SizedBox(height: 20.h),
                          Center(
                            child: CustomButton(
                              text: StringsManager.showMap,
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.trackMap);
                              },
                            ),
                          ),
                        ],
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
