
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/cubit_builder.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/cubit_listener.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_edit_screen/profile_edit_view/widgets/edit_Screen_body.dart';

import 'package:elevate_ecommerce/utils/text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../utils/string_manager.dart';
import '../profile_edit_view_model/profile_edit_view_model.dart';


class ProfileEditScreen extends StatelessWidget {

  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.editProfile,style: AppTextStyles.title(),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocProvider(
          create: (context) => getIt.get<EditProfileScreenViewModel>()..start(),
          child: BlocConsumer<EditProfileScreenViewModel,BaseState>(
              builder: (context, state) {
                return baseBuilder(context, state,  EditScreenBody(viewModel:EditProfileScreenViewModel.get(context) ,));
              },
              listener: (context, state) {
                if(state is SuccessState){
                  Navigator.pushNamed(context, AppRoutes.mainLayOut);
                }
                return baseListener(context, state);

              },

            )),
    );
  }

}

