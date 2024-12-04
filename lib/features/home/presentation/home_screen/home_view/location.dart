import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    const deliverLoction = '2XVP+XC - Sheikh Zayed';
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 25.sp,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          'Deliver to ',
          style: TextStyle(fontSize: 14.sp),
        ),
        Text(
          deliverLoction,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 4.w,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: ColorManager.primary,
          size: 25.sp,
        )
      ],
    );
  }
}
