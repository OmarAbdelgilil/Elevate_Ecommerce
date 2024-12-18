import 'package:elevate_ecommerce/features/home/presentation/permission_screen/permission_view/permission_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../permission_view_model/permission_view_model.dart';
import '../states/permission_states.dart';



class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PermissionsViewModel()..start(),
        child: BlocConsumer<PermissionsViewModel, BaseState>(
          listener: (context, state) {
            if (state is AllPermissionsGrantedState) {
              Navigator.pop(context);
            }
            baseListener(context, state);
          },
          builder: (context, state) {
            if (state is LocationPermissionsDisabledState) {
              return PermissionsBody(
                viewModel: PermissionsViewModel.get(context),
                locationError: LocationError.permissions,
              );
            }
            else if (state is LocationServiceDisabledState) {
              return PermissionsBody(
                viewModel: PermissionsViewModel.get(context),
                locationError: LocationError.services,
              );
            }
            return baseBuilder(
              context,
              state,
              PermissionsBody(
                viewModel: PermissionsViewModel.get(context),
                locationError: LocationError.services,
              ),
            );
          },
        ),
      ),
    );
  }
}