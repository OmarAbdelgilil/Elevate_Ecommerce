import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../view_model/track_map_view_model.dart';

class TrackMapScreenView extends StatelessWidget {
  final String orderId;

  const TrackMapScreenView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = TrackMapViewModel();
        viewModel.listenToLocation(orderId);
        return viewModel;
      },
      child: Scaffold(
        body: Consumer<TrackMapViewModel>(
          builder: (context, orderViewModel, child) {
            return GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                orderViewModel.mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(30.482624410522394, 31.18704102631089),
                zoom: 12,
              ),
              markers: {
                if (orderViewModel.userLatLong != null)
                  Marker(
                    markerId: MarkerId("user"),
                    position: orderViewModel.userLatLong!,
                    infoWindow: InfoWindow(title: "User Location"),
                  ),
                if (orderViewModel.driverLatLong != null)
                  Marker(
                    markerId: MarkerId("driver"),
                    position: orderViewModel.driverLatLong!,
                    infoWindow: InfoWindow(title: "Driver Location"),
                  ),
                if (orderViewModel.storeLatLong != null)
                  Marker(
                    markerId: MarkerId("store"),
                    position: orderViewModel.storeLatLong!,
                    infoWindow: InfoWindow(title: "Store Location"),
                  ),
              },
              polylines: Set<Polyline>.of(orderViewModel.polylines.values),
            );
          },
        ),
      ),
    );
  }
}
