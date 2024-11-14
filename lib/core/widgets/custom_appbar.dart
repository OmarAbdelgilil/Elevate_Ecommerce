import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
