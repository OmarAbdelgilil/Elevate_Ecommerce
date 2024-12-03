import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart';
import 'package:elevate_ecommerce/main.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Update_password_validator/update_password_types_enum.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});


  @override
  Widget build(BuildContext context) {
    UpdatePasswordViewModel viewModel = getIt<UpdatePasswordViewModel>();
    final updatePasswordValidator = viewModel.updatePasswordValidator;
    void updatePassword() {
      viewModel.doIntent(
        UpdatePasswordIntent(

            updatePasswordValidator.currentPasswordController.text,
            updatePasswordValidator.newPasswordController.text,
            ),
      );
    }
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.Reset_password),
        body:  BlocListener<UpdatePasswordViewModel, UpdatePasswordState>(
          listenWhen: (previous, current) {
            return current is LoadingState ||
                current is ErrorState ||
                current is SuccessState;
          },
          listener: (context, state) {
             if (state is ErrorState) {
              var message = extractErrorMessage(state.exception);
              scaffoldMessengerKey.currentState?.clearSnackBars();
              scaffoldMessengerKey.currentState
                  ?.showSnackBar(SnackBar(content: Text(message)));
            }

            if (state is SuccessState) {
           /*   Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.editProfile, (Route route) => false);*/
            }
          },
          child: Form(
            key: updatePasswordValidator.updatePasswordFormKey,
            child:  ValueListenableBuilder<bool>(
              valueListenable: viewModel.fieldsFilledNotifier,
             builder: (context,areAllFieldsFilled,state){
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    CustomtextField(
                        validator: updatePasswordValidator.validate(UpdatePasswordValidTypes.currentPassword),
                        controller: updatePasswordValidator.currentPasswordController,
                        hint: StringsManager.hintCurrentPassword,
                        lable: StringsManager.hintCurrentPassword),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomtextField(
                        validator:updatePasswordValidator.validate(UpdatePasswordValidTypes.newPassword),
                        controller:updatePasswordValidator.newPasswordController,
                        hint: StringsManager.hintNewPassword,
                        lable: StringsManager.hintNewPassword),

                    SizedBox(
                      height: 25.h,
                    ),
                    CustomtextField(
                        validator: updatePasswordValidator.validate(UpdatePasswordValidTypes.confirmPassword),
                        controller:updatePasswordValidator.confirmPasswordController,
                        hint: StringsManager.confirmPasswordHint,
                        lable: StringsManager.confirmPasswordHint),

                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                      text: StringsManager.update,
                      color: areAllFieldsFilled
                          ? primaryColor
                          : Colors.grey,
                      onPressed: areAllFieldsFilled
                          ? () {
                        updatePassword();
                      }
                          : null,
                    )
                  ]),
                );
             }
            ),
          ),
        ),
      ),
    );
  }
}
