import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetPasswordButton extends StatefulWidget {
  final String hint;
  final Function(String)? onChange;
  final TextEditingController controller;
  final bool obscureText;
  final bool? readOnly;
  final String label;
  final String? Function(String?)? validator;
  final String? errorText;
  void Function()? onTap;
  Widget? suffixIcon;
  ResetPasswordButton({
    super.key,
    required this.hint,
    this.onChange,
    this.obscureText = false,
    this.validator,
    this.onTap,
    required this.label,
    this.suffixIcon,
    required this.controller,
    this.errorText,
    this.readOnly,
  });

  @override
  State<ResetPasswordButton> createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  late bool _obscureText; // Controls the text visibility dynamically
  Color labelColor = Colors.grey[850]!;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

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
      onTap: widget.onTap,
      obscureText: _obscureText,
      // obscuringCharacter:'⭐️' ,
      validator: _validate,
      readOnly: widget.readOnly ?? false,
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
          widget.label,
          style: TextStyle(color: labelColor),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: widget.suffixIcon,
        ),
        // No icon if obscureText is false
      ),
    );
  }
}
