import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

class TrackMapBodyScreen extends StatefulWidget {
  final LatLng driverLocation;
  final LatLng userLocation;
  final LatLng storeLocation;

  const TrackMapBodyScreen({
    super.key,
    required this.driverLocation,
    required this.userLocation,
    required this.storeLocation,
  });

  @override
  _TrackMapBodyScreenState createState() => _TrackMapBodyScreenState();
}

class _TrackMapBodyScreenState extends State<TrackMapBodyScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
    _setMarkers();
    _drawRoute();
  }

  /// Set Custom Markers
  void _setMarkers() {
    setState(() {
      _markers.addAll([
        Marker(
          markerId: MarkerId('apartment'),
          position: widget.userLocation,
          infoWindow: InfoWindow(title: "Apartment"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        ),
        Marker(
          markerId: MarkerId('delivery'),
          position: widget.storeLocation,
          infoWindow: InfoWindow(title: "Delivery"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        ),
        Marker(
          markerId: MarkerId('driver'),
          position: widget.driverLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        ),
      ]);
    });
  }

  /// Fetch route from Google Directions API
  Future<void> _drawRoute() async {
    String googleApiKey = "AIzaSyAJOSX1xg5Uklq6cWX5MFaVavkRjjDqCGE"; // Replace with your API key

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${widget.driverLocation.latitude},${widget.driverLocation.longitude}&destination=${widget.userLocation.latitude},${widget.userLocation.longitude}&waypoints=${widget.storeLocation.latitude},${widget.storeLocation.longitude}&key=$googleApiKey";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<LatLng> polylineCoordinates = [];

      var points = data['routes'][0]['overview_polyline']['points'];
      polylineCoordinates = polylinePoints
          .decodePolyline(points)
          .map((p) => LatLng(p.latitude, p.longitude))
          .toList();

      setState(() {
        _polylines.add(
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.pink, // 🔴 RED ROUTE
            width: 4,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: widget.driverLocation, zoom: 14),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            mapType: MapType.normal,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomSheet(),
          ),
        ],
      ),
    );
  }

  /// Bottom Sheet UI
  Widget _buildBottomSheet() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Estimated arrival", style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(height: 4),
          Text("03 Sep 2024, 11:00 AM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Divider(height: 20),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/delivery_person.png'), // Replace with real image
            ),
            title: Text("Muhamed", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Is your delivery hero for today"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.phone, color: Colors.pink), onPressed: () {}),
                IconButton(icon: Icon(Icons.message, color: Colors.pink), onPressed: () {}),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
            child: Text("Order details", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}