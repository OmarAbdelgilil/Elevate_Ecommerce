import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../utils/assets_manager.dart';
import '../../../../../../utils/values_manager.dart';
import '../permission_view_model/permission_view_model.dart';

enum LocationError { services, permissions }

class PermissionsBody extends StatelessWidget {
  const PermissionsBody({
    super.key,
    required this.locationError,
    required this.viewModel,
  });

  final LocationError locationError;
  final PermissionsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: viewModel.getCanPop,
      // ignore: deprecated_member_use
      onPopInvoked: (_) {
        if (!viewModel.getCanPop) {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              const Spacer(),
              SizedBox.square(
                dimension: AppSize.s200,
                child: Lottie.asset(LottieAssets.noPermissions),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p10,
                      vertical: AppPadding.p5,
                    ),
                    child: Text(
                      locationError == LocationError.services
                          ? 'Location Service is Disabled'
                          : 'Location Permissions is Disabled',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p30,
                      vertical: AppPadding.p5,
                    ),
                    child: Text(
                      locationError == LocationError.services
                          ? 'we need location service enabled in order to get your location to send you a vehicle.'
                          : 'we need location permissions in order to get your location to send you a vehicle.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: AppSize.infinity,
                height: AppSize.s50,
                child: ElevatedButton(
                  onPressed: locationError == LocationError.services
                      ? viewModel.askForLocationServices
                      : viewModel.askForLocationPermissions,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.black,
                    foregroundColor: ColorManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                    ),
                  ),
                  child: const Text(
                    'Open Settings',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
