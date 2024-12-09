import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_edit_screen/profile_edit_view/widgets/reset_password_button.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_edit_screen/profile_edit_view_model/profile_edit_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/providers/user_provider.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_textfield.dart';
import '../../../../../../utils/color_manager.dart';
import '../../../../../../utils/string_manager.dart';
import '../../../../../../utils/text_style.dart';
import '../../../../../../utils/values_manager.dart';
import '../../../../../auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import '../profile_edit_validators.dart';

class EditScreenBody extends StatelessWidget {
  EditScreenBody({super.key, required this.viewModel});
  final EditProfileScreenViewModel viewModel;
  final EditProfileValidator validator = getIt<EditProfileValidator>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    validator.firstNameController.text = userProvider.userData?.firstName ?? '';
    validator.lastNameController.text = userProvider.userData?.lastName ?? '';
    validator.emailController.text = userProvider.userData?.email ?? '';
    validator.phoneController.text = userProvider.userData?.phone ?? '';
    validator.passwordController.text = '⭐️⭐️⭐️⭐️⭐️⭐️';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Form(
        key: validator.editDataFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: StringsManager.firstNameFieldLabel.tr(),
                    label: StringsManager.firstNameFieldLabel.tr(),
                    controller: validator.firstNameController,
                    validator:
                        validator.validate(EditProfileValidTypes.firstName),
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                Expanded(
                  child: CustomTextField(
                    hint: StringsManager.lastNameFieldLabel.tr(),
                    label: StringsManager.lastNameFieldLabel.tr(),
                    controller: validator.lastNameController,
                    validator:
                        validator.validate(EditProfileValidTypes.lastName),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            CustomTextField(
              hint: StringsManager.emailFieldHint.tr(),
              label: StringsManager.emailFieldLabel.tr(),
              controller: validator.emailController,
              validator: validator.validate(EditProfileValidTypes.email),
            ),
            const SizedBox(height: AppSize.s16),
            CustomTextField(
              hint: StringsManager.phoneFieldLabel.tr(),
              label: StringsManager.phoneFieldLabel.tr(),
              controller: validator.phoneController,
              validator: validator.validate(EditProfileValidTypes.phone),
            ),
            const SizedBox(height: AppSize.s16),
            ResetPasswordButton(
              hint: StringsManager.phoneFieldLabel.tr(),
              label: StringsManager.passwordFieldLabel.tr(),
              controller: validator.passwordController,
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.ResetPassword);
              },
              obscureText: true,
              readOnly: true,
              suffixIcon: Text(StringsManager.change.tr(),
                  style: AppTextStyles.title(color: ColorManager.primary)),
            ),
            const SizedBox(height: AppSize.s22),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  text: StringsManager.upDate.tr(),
                  color: ColorManager.primary,
                  onPressed: () {
                    if (validator.editDataFormKey.currentState!.validate()) {
                      UpdateProfileRequest request = UpdateProfileRequest(
                        firstName: validator.firstNameController.text,
                        lastName: validator.lastNameController.text,
                        email: validator.emailController.text,
                        phone: validator.phoneController.text,
                      );
                      viewModel.updateUserData(request).then((_) {
                        final userProvider = getIt<UserProvider>();
                        userProvider.updateUserData({
                          'firstName': validator.firstNameController.text,
                          'lastName': validator.lastNameController.text,
                          'email': validator.emailController.text,
                          'phone': validator.phoneController.text,
                        });
                      }).catchError((e) {
                        if (kDebugMode) {
                          print("Error updating user data: $e");
                        }
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
