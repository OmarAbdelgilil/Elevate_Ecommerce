import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutCard extends StatelessWidget {
  final AddressModel address;
  final AddressViewModel viewModel;
  final VoidCallback? onTap;
  final bool isSelected;
  final VoidCallback? onSelected;

  const CheckoutCard({
    super.key,
    required this.address,
    required this.viewModel,
    this.onTap,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onSelected != null) onSelected!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Color(0xFFFEF7FF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.w, right: 16.w, top: 12.h, bottom: 12.h),
          child: Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio<String>(
                              activeColor: primaryColor,
                              value: address.id,
                              groupValue: isSelected ? address.id : null,
                              onChanged: (value) {
                                if (onSelected != null) {
                                  onSelected!();
                                }
                              },
                            ),
                            Text(address.city,
                                style: AppTextStyles.title(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp)),
                          ]),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(address.street,
                        style: AppTextStyles.subtitle(fontSize: 14.sp)),
                  ),
                ])),
            Icon(Icons.edit_outlined, color: Color(0xFF535353), size: 24.sp),
          ]),
        ),
      ),
    );
  }
}
