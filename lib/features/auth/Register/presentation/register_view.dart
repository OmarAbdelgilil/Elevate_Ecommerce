import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/gender_widget.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/register_validator/register_validator_types_enum.dart';
import 'package:elevate_ecommerce/features/auth/Register/presentation/register_viewModel.dart';
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
            registerValidator.phoneController.text
        ),
      );

    }
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(leadingWidth: 300.w,leading: CustomAppBar(title: "Sign Up",onPressed: (){},),),
        body: BlocListener<RegisterViewModel, RegisterScreenState>(

          listenWhen: (previous, current) {
            return current is LoadingState || current is ErrorState ||
                current is SuccessState;
          },
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text("Loading...")
                      ],
                    ),
                  );
                },
              );
            }

            if (state is ErrorState) {
              Navigator.pop(context);
              var message = extractErrorMessage(state.exception);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        Expanded(child: Text(message)),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is SuccessState) {
              Navigator.pop(context);
               Navigator.pushNamed(context, AppRoutes.home);

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
                              child: CustomtextField(
                                  validator: registerValidator.validate(RegisterValidTypes.firstName),
                                  controller:registerValidator.firstNameController,
                                  hint: "Enter first name"
                                  , lable: "First Name"
                              ),
                            ),
                            SizedBox(width: 20.w,),
                            Expanded(
                              child: CustomtextField(
                                  validator: registerValidator.validate(RegisterValidTypes.lastName),
                                  controller:registerValidator.lastNameController,
                                  hint: "Enter last name"
                                  , lable: "Last Name"
                              ),
                            ),
                          ],
                        ),
                       SizedBox(height: 25.h,)

                        ,CustomtextField(
                          validator: registerValidator.validate(RegisterValidTypes.email),
                            controller:registerValidator.emailController,
                            hint: "Enter your email"
                        , lable: "Email"
                        ),
                        SizedBox(height: 25.h,),
                        Row(
                          children: [
                            Expanded(
                              child: CustomtextField(
                                  validator: registerValidator.validate(RegisterValidTypes.password),
                                  controller:registerValidator.passwordController,
                                  hint: "Enter password"
                                  , lable: "Password"
                              ),
                            ),
                            SizedBox(width: 20.w,),

                            Expanded(
                              child: CustomtextField(
                                  validator: registerValidator.validate(RegisterValidTypes.confirmPassword),
                                  controller:registerValidator.confirmPasswordController,
                                  hint: "Confirm password"
                                  , lable: "Confirm password"
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h,),
                        CustomtextField(
                            validator: registerValidator.validate(RegisterValidTypes.phone),
                            controller:registerValidator.phoneController,
                            hint: "Enter phone number"
                            , lable: "Phone"
                        ),

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
                            Text("Creating an account, you agree to our" ,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: blackFontColor,
                                  fontSize: 12.sp
                              ),)
                            ,InkWell(
                              child: Text('Terms&Conditions',style: TextStyle(
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

                        SizedBox(height: 50.h,),
                        BlocBuilder<RegisterViewModel,RegisterScreenState>(
                          builder: (context, state) {
                            switch (state) {
                              case LoadingState():{
                                return const CircularProgressIndicator();
                              }
                              default:{
                                return   CustomButton(text: "Sign up",color: areAllFieldsFilled
                            ?primaryColor
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
                        SizedBox(height: 15.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?" ,style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: blackFontColor,
                                fontSize: 16.sp
                            ),)
                            ,InkWell(
                              child: Text('  Login', style: TextStyle(
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

