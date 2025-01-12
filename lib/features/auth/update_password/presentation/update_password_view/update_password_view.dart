import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
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
        appBar: customAppBar(title: StringsManager.Reset_password.tr()),
        body: BlocListener<UpdatePasswordViewModel, UpdatePasswordState>(
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
              Navigator.of(context).pushNamed(AppRoutes.login);
            }
          },
          child: Form(
            key: updatePasswordValidator.updatePasswordFormKey,
            child: ValueListenableBuilder<bool>(
                valueListenable: viewModel.fieldsFilledNotifier,
                builder: (context, areAllFieldsFilled, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      CustomTextField(
                        validator: updatePasswordValidator
                            .validate(UpdatePasswordValidTypes.currentPassword),
                        controller:
                            updatePasswordValidator.currentPasswordController,
                        hint: StringsManager.hintCurrentPassword.tr(),
                        label: StringsManager.hintCurrentPassword.tr(),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomTextField(
                          validator: updatePasswordValidator
                              .validate(UpdatePasswordValidTypes.newPassword),
                          controller:
                              updatePasswordValidator.newPasswordController,
                          hint: StringsManager.hintNewPassword.tr(),
                          label: StringsManager.hintNewPassword.tr()),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomTextField(
                          validator: updatePasswordValidator.validate(
                              UpdatePasswordValidTypes.confirmPassword),
                          controller:
                              updatePasswordValidator.confirmPasswordController,
                          hint: StringsManager.confirmPasswordHint.tr(),
                          label: StringsManager.confirmPasswordHint.tr()),
                      SizedBox(
                        height: 50.h,
                      ),
                      BlocBuilder<UpdatePasswordViewModel, UpdatePasswordState>(
                        builder: (context, state) {
                          switch (state) {
                            case LoadingState():
                              {
                                return const CircularProgressIndicator(
                                  color: primaryColor,
                                );
                              }
                            default:
                              {
                                return CustomButton(
                                  text: StringsManager.update.tr(),
                                  color: areAllFieldsFilled
                                      ? primaryColor
                                      : Colors.grey,
                                  onPressed: areAllFieldsFilled
                                      ? () {
                                          updatePassword();
                                        }
                                      : null,
                                );
                              }
                          }
                        },
                      )
                    ]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
