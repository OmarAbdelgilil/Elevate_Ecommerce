import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(

    title: Text(

      title,
      style: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w500, color: blackFontColor),
    ),
  );
}
