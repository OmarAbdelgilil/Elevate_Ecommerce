import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/cubit_builder.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/cubit_listener.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view/widgets/save_address_body_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import '../save_address_view_model/states.dart';

class SaveAddressScreen extends StatelessWidget {
  const SaveAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: StringsManager.savedAddresses.tr()),
      body: BlocProvider(
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
              if(state is SuccessState ){


                Navigator.pop(context, true);
              }
              return baseListener(context, state);
            },
            builder: (context, state) {
              return baseBuilder(
                  context,
                  state,
                  SaveAddressBodyScreen(
                    viewModel: SaveAddressViewModel.get(context),
                  ));
            },
          )),
    );
  }
}
