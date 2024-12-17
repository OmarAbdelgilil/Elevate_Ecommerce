import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';

class DeliveryTimeWidget extends StatelessWidget {
  final DateTime deliveryDate;

  const DeliveryTimeWidget({required this.deliveryDate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the delivery date
    final formattedDate =
        DateFormat('dd MMM yyyy, hh:mm a').format(deliveryDate);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery time',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 18),
                  const SizedBox(width: 8),
                  const Text(
                    'Instant, ',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Arrive by $formattedDate',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Schedule',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
