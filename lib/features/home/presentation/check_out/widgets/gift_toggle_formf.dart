import 'package:flutter/material.dart';

class GiftToggleForm extends StatefulWidget {
  const GiftToggleForm({super.key});

  @override
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
              const Text(
                'It is a gift',
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
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter the name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone number',
                hintText: 'Enter the phone number',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
