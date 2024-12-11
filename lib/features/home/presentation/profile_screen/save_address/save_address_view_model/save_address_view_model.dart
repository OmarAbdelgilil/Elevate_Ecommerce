import 'package:elevate_ecommerce/features/home/data/models/request/address_request/address_request.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/user_address_response/UserAddressResponse.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_cubit.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/save_address/save_address_view_model/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/api_result.dart';
import '../../../../domain/usecase/save_user_address.dart';
@injectable
class SaveAddressViewModel extends BaseCubit implements SaveAddressViewModelInput,SaveAddressViewModelOutput{

final SaveUserAddressUseCase _saveUserAddressUseCase;


SaveAddressViewModel(this._saveUserAddressUseCase);

  GoogleMapController? _mapController;
  LatLng? _userLocation;
  String? _mapStyle;


  static SaveAddressViewModel get(BuildContext context) =>
      BlocProvider.of<SaveAddressViewModel>(context);
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController =
  TextEditingController();

  Future<void> _fetchMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style/map_style.json');
  }

  Future<void> _fetchUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(ErrorState("Location services are disabled"));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(ErrorState("Location permission denied"));
          return;
        }
      }

      Position currentPosition = await Geolocator.getCurrentPosition();
      _userLocation = LatLng(currentPosition.latitude, currentPosition.longitude);

      Geolocator.getPositionStream().listen((position) {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      emit(ErrorState("Failed to get location: $e"));
    }
  }

  Future<void> permissionsPermitted() async {
    emit(LoadingState());
    if (_mapStyle == null) {
      await _fetchMapStyle();
    }
    if (_userLocation == null) {
      await _fetchUserLocation();
    }
    emit(ContentState());
  }


  @override
  void start() async {

    emit(LoadingState());

    Future.delayed(const Duration(milliseconds: 100), () {
      emit(CheckLocationPermissionsState());
      emit(LoadingState());

    });
  }
  @override
  set setMapController(GoogleMapController mapController) {
    if (_mapController == null) {
      _mapController = mapController;
    } else {
      print('_____________mapController is already initialized');
    }
  }
  @override
  TextEditingController get getCityController => _cityController;

  @override
  TextEditingController get getPhoneController => _phoneController;

  @override
  TextEditingController get getStreetController => _streetController;

  Future<void> saveUserAddress(AddressRequest request) async {
    emit(LoadingState());

    final result = await _saveUserAddressUseCase.saveAddress(request);

    if (result is Success<UserAddressResponse?>) {
      emit(SuccessState(result.data?.message ?? ''));


    } else if (result is Fail<UserAddressResponse?>) {
      emit(ErrorState(result.toString()));
    }
  }



  @override
  GoogleMapController get getMapController => _mapController!;

  @override
  LatLng get getUserLocation => _userLocation!;

  @override
  String get getMapStyle => _mapStyle!;

}

abstract class SaveAddressViewModelInput {
  set setMapController(GoogleMapController mapController);
}

abstract class SaveAddressViewModelOutput {
  TextEditingController get getPhoneController;

  TextEditingController get getCityController;

  TextEditingController get getStreetController;


  GoogleMapController get getMapController;

  LatLng get getUserLocation;

  String get getMapStyle;
}