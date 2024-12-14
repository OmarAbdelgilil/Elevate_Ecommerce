import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressViewModel extends Cubit<AddressState> {
  final GetAddressesUsecase _getAddressesUsecase;
  final RemoveAddressUsecase _removeAddressUsecase;

  AddressViewModel(
    this._getAddressesUsecase,
    this._removeAddressUsecase,
  ) : super(AddressInitialState());

  void doIntent(AddressIntent intent) {
    switch (intent) {
      case LoadAddressIntent():
        _getAddresses();
        break;
      case RemoveAddressIntent():
        _removeAddress(intent.addressId);
        break;
    }
  }

  Future<void> _getAddresses() async {
    emit(AddressLoadingState());
    final result = await _getAddressesUsecase.getAddresses();
    switch (result) {
      case Success<List<AddressModel>>():
        emit(AddressSuccessState(addressData: result.data));
      case Fail<List<AddressModel>>():
        emit(AddressErrorState(exception: result.exception));
    }
  }

  Future<void> _removeAddress(String addressId) async {
    emit(AddressRemovedState());
    final result = await _removeAddressUsecase.removeAddress(addressId);

    if (result == true) {
      final address = await _getAddressesUsecase.getAddresses();
      switch (address) {
        case Success<List<AddressModel>>():
          emit(AddressSuccessState(addressData: address.data));
          break;
        case Fail<List<AddressModel>>():
          emit(AddressErrorState(exception: address.exception));
          break;
      }
    } else {
      emit(AddressErrorState());
    }
  }
}

sealed class AddressIntent {}

class LoadAddressIntent extends AddressIntent {}

class RemoveAddressIntent extends AddressIntent {
  final String addressId;
  RemoveAddressIntent(this.addressId);
}

sealed class AddressState {}

class AddressInitialState extends AddressState {}

class AddressRemovedState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressSuccessState extends AddressState {
  final List<AddressModel>? addressData;
  AddressSuccessState({this.addressData});
}

class AddressErrorState extends AddressState {
  final Exception? exception;
  AddressErrorState({this.exception});
}
