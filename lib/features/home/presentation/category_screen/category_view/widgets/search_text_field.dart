import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          prefixIcon: Icon(
            Icons.search,
            color: ColorManager.lightGrey,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.lightGrey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: 'Search',
          hintStyle: TextStyle(color: ColorManager.lightGrey)),
    );
  }
}
