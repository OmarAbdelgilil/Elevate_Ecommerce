import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_view/addresseCard.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/network/api/extract_error_message.dart';
import '../../../../../core/routes/app_routes.dart';



class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewModel addressViewModel = getIt<AddressViewModel>();

    return BlocProvider(
      create: (context) => addressViewModel..doIntent(LoadAddressIntent()),
      child: Scaffold(
        appBar: customAppBar(title: StringsManager.savedAddress.tr()),
        body: BlocListener<AddressViewModel, AddressState>(
          listener: (context, state) {
            if (state is AddressRemovedState) {
              addressViewModel.doIntent(LoadAddressIntent());
            }
          },
          child: BlocBuilder<AddressViewModel, AddressState>(
            builder: (context, state) {
              if (state is AddressLoadingState) {
                return const Center(child: CircularProgressIndicator(color: ColorManager.primary,));
              } else if (state is AddressErrorState) {
                return Center(child: Text(extractErrorMessage(state.exception)));
              } else if (state is AddressSuccessState) {
                return Column(
                  children: [
                    Expanded(
                      child: state.addressData!.isEmpty
                          ? Center(child: Text(StringsManager.adressNotFound.tr()))
                          : ListView.builder(
                        itemCount: state.addressData!.length,
                        itemBuilder: (context, index) {
                          return AddresseCard(
                            viewModel: addressViewModel,
                            address: state.addressData![index],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(
                        text: StringsManager.addAdress.tr(),
                        onPressed: () async {
                          // Navigate to the address save screen and wait for the result
                          final result = await Navigator.pushNamed(context, AppRoutes.saveAddressScreen);
                          if (result == true) {
                            // Trigger reload if the result indicates data was changed
                            addressViewModel.doIntent(LoadAddressIntent());
                          }
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
