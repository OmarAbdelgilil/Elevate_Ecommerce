import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final Color? fontColor;
  final double fontSize;
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.width = double.infinity,
      this.height = 48,
      this.fontSize = 16,
      this.fontColor});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width.w, height.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        backgroundColor: color ?? primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize.sp, color: fontColor ?? Color(0xffF9F9F9)),
      ),
    );
  }
}
