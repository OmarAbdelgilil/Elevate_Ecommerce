import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackMapViewModel extends ChangeNotifier {
  LatLng? userLatLong;
  LatLng? driverLatLong;
  LatLng? storeLatLong;

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
        storeLatLong = LatLng(30.482624410522394, 31.18704102631089); // Store location (static)

        notifyListeners();
      }
    });
  }

  @override
  Future<Map<String, dynamic>> calculateTwoPoints(
      LatLng pointA, LatLng pointB) async {
    const String baseUrl = "https://router.hereapi.com/v8/";
    const String apiKey = "Vc6Uhd34IMqaeQskoAJOIGbVv2RzpWgrO07T9WYuM9s";
    const String endpoint = "routes";
    const String url = baseUrl + endpoint;
    final dio = Dio();
    Map<String, dynamic> result = {"data": -1};
    await dio.get(url, queryParameters: {
      "apiKey": apiKey,
      "transportMode": "car",
      "origin": "${pointA.latitude},${pointA.longitude}",
      "destination": "${pointB.latitude},${pointB.longitude}",
      "return": "summary,polyline",
    }).then((value) {
      double time =
          value.data["routes"][0]["sections"][0]["summary"]["duration"] / 60;
      int distance =
      value.data["routes"][0]["sections"][0]["summary"]["length"];
      String polylineCode = value.data["routes"][0]["sections"][0]["polyline"];
      result = {
        "time": time.round(),
        "distance": distance,
        "polylineCode": polylineCode,
      };
    });
    return result;
  }

}
