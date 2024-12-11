import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_view/addresseCard.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewModel addressViewModel = getIt<AddressViewModel>();
    return BlocProvider(
      create: (context) => addressViewModel..doIntent(LoadAddressIntent()),
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.savedAddress.tr()),
        body: BlocBuilder<AddressViewModel, AddressState>(
          builder: (context, state) {
            if (state is AddressRemovedState) {
              addressViewModel.doIntent(LoadAddressIntent());
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded(
                  child: state is AddressLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        )
                      : state is AddressErrorState
                          ? Center(
                              child: Text(extractErrorMessage(state.exception)),
                            )
                          : state is AddressSuccessState
                              ? (state.addressData!.isEmpty
                                  ? Center(
                                      child: Text(
                                          StringsManager.adressNotFound.tr()),
                                    )
                                  : ListView.builder(
                                      itemCount: state.addressData!.length,
                                      itemBuilder: (context, index) {
                                        return AddresseCard(
                                          viewModel: addressViewModel,
                                          address: state.addressData![index],
                                        );
                                      },
                                    ))
                              : SizedBox(),
                ),

                // Add New Address Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    text: StringsManager.addAdress.tr(),
                    onPressed: () {
                      // Navigate to add address screen
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
