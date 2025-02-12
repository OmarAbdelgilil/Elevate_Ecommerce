import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:provider/provider.dart';

class TrackMapViewModel extends ChangeNotifier {
  LatLng? userLatLong;
  LatLng? driverLatLong;
  LatLng? storeLatLong;
  GoogleMapController? mapController;
  Map<PolylineId, Polyline> polylines = {};
  final PolylinePoints polylinePoints = PolylinePoints();

  void listenToLocation(String orderId) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        userLatLong = LatLng(data['latitude'], data['longitude']);
        driverLatLong = LatLng(data['driverLat'], data['driverLong']);
        storeLatLong = LatLng(30.482624410522394, 31.18704102631089);

        _createPolylines();
        notifyListeners();
      }
    });
  }

  Future<void> _createPolylines() async {
    if (userLatLong == null || driverLatLong == null || storeLatLong == null) return;

    List<LatLng> polylineCoordinates = await _getPolylinePoints(userLatLong!, driverLatLong!, storeLatLong!);

    const PolylineId polylineId = PolylineId("walking_route");
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );

    polylines[polylineId] = polyline;
    notifyListeners();
  }

  Future<List<LatLng>> _getPolylinePoints(LatLng start, LatLng waypoint, LatLng end) async {
    String url =
        "http://router.project-osrm.org/route/v1/foot/${start.longitude},${start.latitude};${waypoint.longitude},${waypoint.latitude};${end.longitude},${end.latitude}?overview=full&geometries=polyline";

    Response response = await Dio().get(url);

    if (response.statusCode == 200) {
      List<dynamic> routes = response.data["routes"];
      if (routes.isNotEmpty) {
        String encodedPolyline = routes[0]["geometry"];
        return polylinePoints.decodePolyline(encodedPolyline).map((point) => LatLng(point.latitude, point.longitude)).toList();
      }
    }
    return [];
  }


}

