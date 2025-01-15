import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onSearchSubmitted;
  final Function(String) onChanged;

  const SearchTextField({
    super.key,
    required this.onSearchSubmitted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
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
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintText: StringsManager.search.tr(),
        hintStyle: TextStyle(color: ColorManager.lightGrey),
      ),
      onChanged: (value) {
        onChanged(value);
      },
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          onSearchSubmitted(value);
        }
      },
    );
  }
}
