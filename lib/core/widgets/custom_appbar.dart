import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500,color: blackFontColor),
          )
        ],
      ),
    );
  }
}
