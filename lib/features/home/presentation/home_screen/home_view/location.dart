import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    const deliverLoction = '2XVP+XC - Sheikh Zayed';
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 25.sp,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          StringsManager.deliverto.tr(),
          style: TextStyle(fontSize: 14.sp),
        ),
        Text(
          deliverLoction,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 4.w,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: ColorManager.primary,
          size: 25.sp,
        )
      ],
    );
  }
}*/



class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final saveAddressViewModel = BlocProvider.of<SaveAddressViewModel>(context);

    return BlocBuilder<SaveAddressViewModel, BaseState>(
      builder: (context, state) {
        String deliverLocation = 'Fetching location...';

        if (state is ContentState) {
          if (saveAddressViewModel.getUserLocation == null) {
            deliverLocation = 'Location unavailable';
          } else {
            deliverLocation =
            '${saveAddressViewModel.getStreetController.text}, ${saveAddressViewModel.getCityController.text}';
          }
        } else if (state is ErrorState) {
          deliverLocation = 'Location unavailable';
        }

        return Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 25.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              StringsManager.deliverto.tr(),
              style: TextStyle(fontSize: 14.sp),
            ),
            Expanded(
              child: Text(
                deliverLocation,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.keyboard_arrow_down,
              color: ColorManager.primary,
              size: 25.sp,
            ),
          ],
        );
      },
    );
  }
}
