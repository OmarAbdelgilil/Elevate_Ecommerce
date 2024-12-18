import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';

void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(StringsManager.loginRequired.tr()),
        content:  Text(StringsManager.loginRequiredMessage.tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(StringsManager.cancel.tr(),style: AppTextStyles.title(color: ColorManager.black),),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(24)
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: Text(
                StringsManager.login.tr(),
                style:  AppTextStyles.title(color: ColorManager.white),
              ),
            ),
          ),
        ],
      );
    },
  );
}
