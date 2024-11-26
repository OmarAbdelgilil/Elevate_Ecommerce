import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/color_manager.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({super.key, required this.text});
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return                 ElevatedButton(

      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary ,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),



      ),
      onPressed: () {

      },
      child:text ,
    );
  }
}
