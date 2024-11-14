import 'package:flutter/material.dart';

class CustomtextField extends StatefulWidget {
  final String hint;
  final Function(String)? onChange;
  final TextEditingController controller;
  final bool? obscureText;
  final String lable;
  final String? Function(String?)? validator;
  final String? errorText;
  const CustomtextField(
      {super.key,
      required this.hint,
      this.onChange,
      this.obscureText,
      this.validator,
      required this.lable,
      required this.controller,
      this.errorText});

  @override
  State<CustomtextField> createState() => _CustomtextFieldState();
}

class _CustomtextFieldState extends State<CustomtextField> {
  bool hasError = false;
  Color labelColor = Colors.grey[850]!;
  String? _validate(String? value) {
    final error = widget.validator != null
        ? widget.validator!(value)
        : (value!.isEmpty ? 'This field is required' : null);
    if (error != null && error.isNotEmpty) {
      setState(() {
        labelColor = Colors.red;
      });
    }
    return error;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      validator: _validate,
      onChanged: widget.onChange,
      controller: widget.controller,
      decoration: InputDecoration(
        errorText: widget.errorText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]!),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Text(
          widget.lable,
          style: TextStyle(color: labelColor),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
