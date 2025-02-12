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
            return GoogleMap();
          },
        ),
      ),
    );
  }
}
