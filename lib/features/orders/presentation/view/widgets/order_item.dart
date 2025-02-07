import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String orderId;
  final String image;
  final String orderNumber;
  final String title;
  final String price;
  final void Function()? onPressed;
  const OrderItemWidget(
      {super.key, required this.orderId,  required this.title, required this.price, required this.orderNumber, required this.image, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorManager.grey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 30),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              width: 127,
              height: 125,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'EGP $price',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${StringsManager.orderNumber.tr()} $orderNumber',
                    style:const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    text: StringsManager.orderTrackButton.tr(),
                    fontSize: 13,
                    height: 35,
                    onPressed: onPressed,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
