import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/assets_manager.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int currentStep = 0;
  late Timer timer;

  List<String> steps = [
    StringsManager.ReceivedYourOrder,
    StringsManager.PreparingYourOrder,
    StringsManager.OutForDelivery,
    StringsManager.Delivered

  ];

  @override
  void initState() {
    super.initState();
    startStepperProgress();
  }

  void startStepperProgress() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (currentStep < steps.length - 1) {
        setState(() {
          currentStep++;
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: StringsManager.trackOrder.tr()),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/png/step3.png",width: 500.w,height:90.h,)),
            Center(
              child: Lottie.asset(LottieAssets.trackCar,width:MediaQuery.of(context).size.width)
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                AnotherStepper(
                  stepperList: steps.asMap().entries.map((entry) {
                    int index = entry.key;
                    String step = entry.value;

                    return StepperData(
                      title: StepperText(step,textStyle:AppTextStyles.title(fontWeight: FontWeight.w500) ),
                      subtitle: StepperText("03 Sep 2024 - 2:10",textStyle:AppTextStyles.subtitle(fontSize: 15.sp)),
                      iconWidget: Icon(
                        Icons.radio_button_checked,
                        color: index <= currentStep ? ColorManager.primary : ColorManager.lightGrey,
                      ),
                    );
                  }).toList(),
                  stepperDirection: Axis.vertical,
                  activeIndex: currentStep,
                  barThickness: 2,
                  inverted: false,
                  activeBarColor: ColorManager.primary,

                ),
                if (currentStep >= 2) ...[
                  SizedBox(height: 20.h),
                  Center(
                    child:
                    CustomButton(text: StringsManager.showMap
                      ,onPressed:() {
                        Navigator.pushNamed(context, AppRoutes.trackMap);
                      },),

                  ),
                ],
              ],),
            )

          ],
        ),
      ),
    );
  }
}
