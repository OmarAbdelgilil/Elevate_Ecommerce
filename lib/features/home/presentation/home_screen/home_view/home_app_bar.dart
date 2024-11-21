import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/search_text_field.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget homeAppBar() {
  return AppBar(
    title: Row(
      children: [
        SvgPicture.asset(SVGAssets.homeScreenLogo),
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
