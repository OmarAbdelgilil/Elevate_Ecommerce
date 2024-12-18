import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/features/home/presentation/check_out/widgets/checkout_card.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSection extends StatefulWidget {
  final AddressViewModel viewModel;

  const AddressSection({super.key, required this.viewModel});

  @override
  // ignore: library_private_types_in_public_api
  _AddressSectionState createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  String? selectedAddressId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressViewModel, AddressState>(
      builder: (context, state) {
        if (state is AddressLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          );
        } else if (state is AddressErrorState) {
          return Center(
            child: Text(
              state.exception?.toString() ?? 'An error occurred',
            ),
          );
        } else if (state is AddressSuccessState) {
          final addresses = state.addressData;

          if (addresses == null || addresses.isEmpty) {
            return const Center(
              child: Text(StringsManager.adressNotFound),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Delivery address'.tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return CheckoutCard(
                    viewModel: widget.viewModel,
                    address: addresses[index],
                    isSelected: addresses[index].id == selectedAddressId,
                    onSelected: () {
                      setState(() {
                        selectedAddressId = addresses[index].id;
                      });
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: primaryColor,
                      backgroundColor: Colors.transparent,
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Add new'.tr(),
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}