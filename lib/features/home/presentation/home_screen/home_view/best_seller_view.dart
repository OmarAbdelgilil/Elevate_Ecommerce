import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bestSeller_screen extends StatelessWidget {
  const bestSeller_screen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:AppBar(title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text("Best seller", style: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w500, color: blackFontColor),),
          Text("Bloom with our exquisite best sellers", style: TextStyle(
              fontSize: 13.sp, fontWeight: FontWeight.w500, color: blackFontColor),),

        ],


    )));
  }
}
