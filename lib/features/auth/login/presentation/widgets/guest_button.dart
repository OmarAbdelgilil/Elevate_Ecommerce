import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.mainLayOut, (Route route) => false);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            side: const BorderSide(color: Colors.black, width: 1),
          ),
          child: const Text(
            'Continue as guest',
            style: TextStyle(fontSize: 16, color: Color(0xFF535353)),
          ),
        ));
  }
}
