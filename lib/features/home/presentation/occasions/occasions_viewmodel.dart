import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_occations_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsViewmodel extends Cubit<OccasionsState> {
  final GetOccasionsUsecase _getOccationsUsecase;
  OccasionsViewmodel(this._getOccationsUsecase) : super(InitialState());

  void doIntent(OccasionsIntent intent) {
    switch (intent) {
      case LoadOccationsIntent():
        _getOccations();
        break;
    }
  }

  Future<void> _getOccations() async {
    emit(LoadingState());
    final result = await _getOccationsUsecase.getAllOccasions();
    switch (result) {
      case Success<Occasions?>():
        emit(SuccessOccasionsState(occasions: result.data!.occasions));
      case Fail<Occasions?>():
        emit(ErrorState(exception: result.exception));
    }
  }
}

sealed class OccasionsIntent {}

class LoadOccationsIntent extends OccasionsIntent {}

sealed class OccasionsState {}

class InitialState extends OccasionsState {}

class LoadingState extends OccasionsState {}

class SuccessOccasionsState extends OccasionsState {
  List<OccasionModel>? occasions;
  SuccessOccasionsState({this.occasions});
}

class ErrorState extends OccasionsState {
  Exception? exception;
  ErrorState({this.exception});
}
