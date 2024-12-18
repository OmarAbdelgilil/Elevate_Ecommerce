import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_validator/register_validator_types_enum.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_view/gender_widget.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/Register_viewModel/register_viewModel.dart';
import 'package:elevate_ecommerce/main.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedGenderInView = 'male';
    RegisterViewModel viewModel = getIt<RegisterViewModel>();
    final registerValidator = viewModel.registerValidator;
    void register() {
      viewModel.doIntent(
        RegisterIntent(
            selectedGenderInView,
            registerValidator.firstNameController.text,
            registerValidator.lastNameController.text,
            registerValidator.emailController.text,
            registerValidator.passwordController.text,
            registerValidator.confirmPasswordController.text,
            registerValidator.phoneController.text),
      );
    }

    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.signUp.tr()),
        body: BlocListener<RegisterViewModel, RegisterScreenState>(
          listenWhen: (previous, current) {
            return current is LoadingState ||
                current is ErrorState ||
                current is SuccessState;
          },
          listener: (context, state) {
            // if (state is LoadingState) {
            //   showDialog(
            //     context: context,
            //     barrierDismissible: false,
            //     builder: (context) {
            //       return const AlertDialog(
            //         content: Row(
            //           children: [
            //             CircularProgressIndicator(),
            //             SizedBox(width: 16),
            //             Text("Loading...")
            //           ],
            //         ),
            //       );
            //     },
            //   );
            // }

            if (state is ErrorState) {
              var message = extractErrorMessage(state.exception);
              scaffoldMessengerKey.currentState?.clearSnackBars();
              scaffoldMessengerKey.currentState
                  ?.showSnackBar(SnackBar(content: Text(message)));
            }

            if (state is SuccessState) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.mainLayOut, (Route route) => false);
            }
          },
          child: Form(
            key: registerValidator.registerFormKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: viewModel.fieldsFilledNotifier,
                builder: (context, areAllFieldsFilled, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  validator: registerValidator
                                      .validate(RegisterValidTypes.firstName),
                                  controller:
                                      registerValidator.firstNameController,
                                  hint: StringsManager.firstNameHint.tr(),
                                  label:
                                      StringsManager.firstNameFieldLabel.tr()),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  validator: registerValidator
                                      .validate(RegisterValidTypes.lastName),
                                  controller:
                                      registerValidator.lastNameController,
                                  hint: StringsManager.lastNameHint.tr(),
                                  label:
                                      StringsManager.lastNameFieldLabel.tr()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextField(
                            validator: registerValidator
                                .validate(RegisterValidTypes.email),
                            controller: registerValidator.emailController,
                            hint: StringsManager.emailFieldHint.tr(),
                            label: StringsManager.emailFieldLabel.tr()),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  validator: registerValidator
                                      .validate(RegisterValidTypes.password),
                                  controller:
                                      registerValidator.passwordController,
                                  hint: StringsManager.passwordHint.tr(),
                                  label:
                                      StringsManager.passwordFieldLabel.tr()),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: CustomTextField(
                                  validator: registerValidator.validate(
                                      RegisterValidTypes.confirmPassword),
                                  controller: registerValidator
                                      .confirmPasswordController,
                                  hint: StringsManager.confirmPasswordHint.tr(),
                                  label:
                                      StringsManager.confirmPasswordHint.tr()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextField(
                            validator: registerValidator
                                .validate(RegisterValidTypes.phone),
                            controller: registerValidator.phoneController,
                            hint: StringsManager.phoneNumberHint.tr(),
                            label: StringsManager.phoneFieldLabel.tr()),
                        GenderWidget(
                          initialGender: 'male',
                          onGenderChanged: (selectedGender) {
                            print('Selected Gender: $selectedGender');
                            selectedGenderInView = selectedGender;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringsManager.creatAccountText.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: blackFontColor,
                                  fontSize: 12.sp),
                            ),
                            InkWell(
                              child: Text(
                                StringsManager.termscondition.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                  color: blackFontColor,
                                  fontSize: 12.sp,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        BlocBuilder<RegisterViewModel, RegisterScreenState>(
                          builder: (context, state) {
                            switch (state) {
                              case LoadingState():
                                {
                                  return const CircularProgressIndicator();
                                }
                              default:
                                {
                                  return CustomButton(
                                    text: StringsManager.signUp.tr(),
                                    color: areAllFieldsFilled
                                        ? primaryColor
                                        : Colors.grey,
                                    onPressed: areAllFieldsFilled
                                        ? () {
                                            register();
                                          }
                                        : null,
                                  );
                                }
                            }
                          },
                          buildWhen: (previous, current) {
                            return true;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringsManager.alreadyHaveAccount.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: blackFontColor,
                                  fontSize: 16.sp),
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, AppRoutes.login),
                              child: Text(
                                '  ${StringsManager.login.tr()}',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
