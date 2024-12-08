import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddresseCard extends StatelessWidget {
  final AddressModel address;
  final AddressViewModel viewModel;
  const AddresseCard({super.key, required this.address, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.sp,
      width: double.infinity,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined ,color: Colors.black ,size:23,),
                      SizedBox(width:2.w,),
                      Text(
                        address.city,
                        style:AppTextStyles.title(fontWeight: FontWeight.w500,fontSize: 18.sp),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          viewModel.doIntent(RemoveAddressIntent(address.id));
                        },
                          child: Icon(Icons.delete_sharp, color: Colors.red,size: 26,)),
                      SizedBox(width: 2.w,),
                      Icon(Icons.edit, color: Colors.black),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Text(
                " ${address.street}",

                style:AppTextStyles.subtitle(fontSize: 15.sp),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
