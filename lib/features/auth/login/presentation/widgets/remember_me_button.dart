import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatelessWidget {
  final ValueNotifier<bool> notifier;

  const RememberMeCheckbox({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: notifier,
          builder: (context, isChecked, _) {
            return Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                notifier.value = value ?? false;
              },
            );
          },
        ),
        const Text(
          'Remember me',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
