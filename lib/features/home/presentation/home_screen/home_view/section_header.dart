import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Function() onpressed;
  const SectionHeader({
    super.key,
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
              onPressed: onpressed,
              child: Text(
                StringsManager.viewAllButtonText.tr(),
                style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorManager.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.primary),
              ))
        ],
      ),
    );
  }
}
