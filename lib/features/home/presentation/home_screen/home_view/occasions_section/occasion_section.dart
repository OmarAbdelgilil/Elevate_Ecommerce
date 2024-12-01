import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/occasion.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/occasions_section/occasion_item.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_view/section_header.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_screen.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionSection extends StatelessWidget {
  final List<OccasionModel>? occasionList;
  final Exception? exception;
  final bool loading;
  const OccasionSection(
      {super.key, this.occasionList, this.exception, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
            title: StringsManager.occasionSectionHeader,
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OccasionsScreen(),
              ));
            }),
        if (loading)
          const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          ),
        if (occasionList != null)
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: occasionList!.length,
              itemBuilder: (context, index) => OccasionItem(
                item: occasionList![index],
              ),
            ),
          ),
        if (exception != null)
          const Center(
            child: Text(StringsManager.occasionSectionError),
          )
      ],
    );
  }
}
