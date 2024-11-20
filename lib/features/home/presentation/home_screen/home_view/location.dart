import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    const deliverLoction = '2XVP+XC - Sheikh Zayed';
    return const Row(
      children: [
        Icon(Icons.location_on_outlined),
        SizedBox(
          width: 8,
        ),
        Text('Deliver to '),
        Text(
          deliverLoction,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 4,
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: ColorManager.primary,
          size: 25,
        )
      ],
    );
  }
}
