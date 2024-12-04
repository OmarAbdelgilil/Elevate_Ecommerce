import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/search_text_field.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    title: Row(
      children: [
        SvgPicture.asset(
          SVGAssets.homeScreenLogo,
          width: 90.w,
          height: 26.h,
        ),
        const SizedBox(
          width: 4,
        ),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SearchTextField(),
        ))
      ],
    ),
  );
}
