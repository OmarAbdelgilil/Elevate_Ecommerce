import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../profile_screen/save_address/save_address_view_model/states.dart';



class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final saveAddressViewModel = BlocProvider.of<SaveAddressViewModel>(context);

    return BlocProvider(
        create: (context) => GetIt.I<SaveAddressViewModel>()..start(),
        child: BlocConsumer<SaveAddressViewModel, BaseState>(
          listener: (context, state) {
            if (state is CheckLocationPermissionsState) {
              Navigator.pushNamed(context, AppRoutes.permissionScreen)
                  .whenComplete(
                    () {
                  SaveAddressViewModel.get(context).permissionsPermitted();
                },
              );
            }
            if (state is SuccessState) {
              Navigator.pop(context, true);
            }
            return baseListener(context, state);
          },
          builder: (context, state) {
            return baseBuilder(
                context,
                state,
                UserLocation(
                  viewModel: SaveAddressViewModel.get(context),
                ));
          },
        ));
  }



}


class UserLocation extends StatelessWidget {
  const UserLocation({super.key, required this.viewModel});
  final SaveAddressViewModel viewModel;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Row(
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
            viewModel.getStreetController.text,
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
    );;
  }
}
