import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderWidget extends StatefulWidget {
  final String initialGender;
  final ValueChanged<String> onGenderChanged;

  const GenderWidget({
    super.key,
    required this.initialGender,
    required this.onGenderChanged,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender;
  }

  void _updateGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onGenderChanged(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: gray53Color,
          ),
        ),
        SizedBox(width: 40.w),
        Row(
          children: [
            Radio<String>(
              value: 'female',
              activeColor: primaryColor,
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) _updateGender(value);
              },
            ),
            Text(
              'Female',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: gray53Color,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'male',
              activeColor: primaryColor,
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) _updateGender(value);
              },
            ),
            Text(
              'Male',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: gray53Color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

