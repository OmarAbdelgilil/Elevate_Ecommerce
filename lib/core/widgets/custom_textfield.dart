import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  final String hint;
  final Function(String) onChange;
  final bool? obscureText;
  final String lable;
  const CustomtextField({
    super.key,
    required this.hint,
    required this.onChange,
    this.obscureText,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        label: Text(
          lable,
          style: const TextStyle(color: Colors.grey),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
