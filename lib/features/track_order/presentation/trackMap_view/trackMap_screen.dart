import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/utils/assets_manager.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:elevate_ecommerce/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackmapScreen extends StatefulWidget {
  @override
  _TrackmapScreenState createState() => _TrackmapScreenState();
}

class _TrackmapScreenState extends State<TrackmapScreen> {
  GoogleMapController? _mapController;
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location services are disabled")));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Location permission denied")));
        return;
      }
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _userLocation = LatLng(currentPosition.latitude, currentPosition.longitude);
    });

    Geolocator.getPositionStream().listen((position) {
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _userLocation == null
              ? Center(child: CircularProgressIndicator(color: ColorManager.primary,))
              : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _userLocation!,
              zoom: 15,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: {
              Marker(
                markerId: MarkerId("currentLocation"),
                position: _userLocation!,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            },
            polylines: {
              Polyline(
                polylineId: PolylineId("deliveryRoute"),
                color: Colors.pink,
                width: 4,
                points: [
                  LatLng(30.0844, 31.2323),
                  _userLocation!,
                ],
              )
            },
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.estmaitedArrival,
                        style: AppTextStyles.subtitle(fontSize:13.sp,fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "03 Sep 2024, 11:00 AM",
                        style:  AppTextStyles.title(fontSize:12.sp,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          SvgPicture.asset(SVGAssets.deliveryBoy,
                              width:45.w, height:45.h),
                        SizedBox(width: 7.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Muhamed", style: AppTextStyles.title(fontSize: 14.sp,fontWeight: FontWeight.w600)),
                        Text(StringsManager.isYourDeliveryHero,style: AppTextStyles.subtitle(fontSize:13.sp,fontWeight: FontWeight.w500)),

                        ],),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.phone, color: ColorManager.primary,size: 20,),
                            onPressed: () {},
                          ),
                        ),
                          SizedBox(width: 7.w,),
                        Expanded(
                          child: IconButton(

                            icon: Icon(Icons.message, color: ColorManager.primary,size: 20),
                            onPressed: () {},
                          ),
                        )
                      ],)
                    ],
                  ),




                  SizedBox(height: 10.h),

               CustomButton(text: StringsManager.OrderDetails,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
