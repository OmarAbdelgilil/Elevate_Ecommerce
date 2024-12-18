import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_validator/save_address_validator.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:elevate_ecommerce/utils/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di/di.dart';
import '../../../../../../../core/providers/user_provider.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custom_textfield.dart';
import '../../../../../../../utils/string_manager.dart';
import '../../save_address_validator/save_address_validator_types.dart';
import 'map_widget.dart';

class SaveAddressBodyScreen extends StatelessWidget {
   const SaveAddressBodyScreen({super.key, required this.viewModel});
final SaveAddressViewModel viewModel;
   static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = getIt<UserProvider>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height:MediaQuery.of(context).size.height*.3,

              child: MapWidget(viewModel: viewModel),),

              SizedBox(height: AppSize.s30.h,),
              CustomTextField(
                hint: StringsManager.cityFieldLabel,
                label: StringsManager.cityFieldLabel,
                controller: viewModel.getCityController,
                validator: AppValidators.validateNotEmpty,

              ),
              SizedBox(height: AppSize.s20.h,),

              CustomTextField(
                hint: StringsManager.streetFieldLabel,
                label: StringsManager.streetFieldLabel,
                controller: viewModel.getStreetController,
                validator: AppValidators.validateNotEmpty,

              ),
              SizedBox(height: AppSize.s20.h,),

              CustomTextField(
                hint: StringsManager.phoneFieldLabel,
                label: StringsManager.phoneFieldLabel,
                controller: viewModel.getPhoneController,
                validator: AppValidators.validatePhoneNumber,

              ),
              SizedBox(height: AppSize.s20.h,),

              CustomTextField(
                hint: StringsManager.userName,
                label: StringsManager.userName,
                controller: viewModel.getUserNameController,
                validator: AppValidators.validateNotEmpty,

              ),
              SizedBox(height: AppSize.s40.h,),
              SizedBox(
                height: AppSize.s50,
                child: CustomButton(
                  text: StringsManager.saveAddress,
                  onPressed: ()  {
                    if (formKey.currentState!.validate()) {
                      AddressRequest request = AddressRequest(
                        city: viewModel.getCityController.text,
                        street: viewModel.getStreetController.text,
                        phone: viewModel.getPhoneController.text,
                        lang:  viewModel.getUserLocation.longitude.toString(),
                        lat:   viewModel.getUserLocation.latitude.toString() ,
                        username: viewModel.getUserNameController.text,
                      );
                      viewModel.saveUserAddress(request);
                      viewModel.clearTextControllers();

                    }


                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
