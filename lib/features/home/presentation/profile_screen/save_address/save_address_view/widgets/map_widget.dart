import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/save_address_view_model.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../utils/values_manager.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.viewModel});
  final SaveAddressViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: false,
          scrollGesturesEnabled: false,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          style: viewModel.getMapStyle,
          onMapCreated: (controller) {
            viewModel.setMapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: viewModel.getUserLocation,
            zoom: AppSize.s16,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            SVGAssets.locationIcon,
            colorFilter:
                const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn),
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
