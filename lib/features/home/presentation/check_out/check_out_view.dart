import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.deliveryDate});
  final DateTime deliveryDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(title: 'Checkout'),
          DeliveryTimeWidget(
            deliveryDate: deliveryDate,
          ),
          GiftToggleForm(),
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final Function(int step) onStepTap;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.onStepTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onStepTap(1),
          child: _buildStep(1, "Address"),
        ),
        _buildLine(),
        GestureDetector(
          onTap: () => onStepTap(2),
          child: _buildStep(2, "Payment"),
        ),
        _buildLine(),
        GestureDetector(
          onTap: () => onStepTap(3),
          child: _buildStep(3, "Track order"),
        ),
      ],
    );
  }

  Widget _buildStep(int step, String title) {
    bool isActive = step <= currentStep;
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: isActive ? primaryColor : Colors.grey[300],
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey,
      ),
    );
  }
}

class GiftToggleForm extends StatefulWidget {
  const GiftToggleForm({Key? key}) : super(key: key);

  @override
  _GiftToggleFormState createState() => _GiftToggleFormState();
}

class _GiftToggleFormState extends State<GiftToggleForm> {
  bool isGift = false; // To track the switch state

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
        border: Border.all(color: Colors.grey),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // Navigate to scheduling screen
              Navigator.pushNamed(context, '/scheduleScreen');
            },
            child: const Text(
              'Schedule',
              style: TextStyle(
                color: Colors.pink,
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
