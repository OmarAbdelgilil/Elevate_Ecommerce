import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GiftToggleForm extends StatefulWidget {
  const GiftToggleForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GiftToggleFormState createState() => _GiftToggleFormState();
}

class _GiftToggleFormState extends State<GiftToggleForm> {
  bool isGift = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Switch(
                value: isGift,
                activeColor: Colors.pink,
                onChanged: (value) {
                  setState(() {
                    isGift = value;
                  });
                },
              ),
              const SizedBox(width: 8),
              Text(
                'It is a gift'.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isGift) ...[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name'.tr(),
                hintText: 'Enter the name'.tr(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone number'.tr(),
                hintText: 'Enter the phone number'.tr(),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
