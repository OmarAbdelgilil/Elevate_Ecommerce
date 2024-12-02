import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_homepage_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewmodel extends Cubit<HomeState> {
  final GetHomepageUsecase _homepageUsecase;
  HomeScreenViewmodel(this._homepageUsecase) : super(InitialState());

  void doIntent(HomeIntent intent) {
    switch (intent) {
      case LoadHomeIntent():
        _getHomePage();
    }
  }

  Future<void> _getHomePage() async {
    emit(LoadingState());
    final result = await _homepageUsecase.getHomePage();
    switch (result) {
      case Success<Home?>():
        emit(SuccessState(homeData: result.data));
      case Fail<Home?>():
        emit(ErrorState(exception: result.exception));
    }
  }
}

sealed class HomeIntent {}

class LoadHomeIntent extends HomeIntent {}

sealed class HomeState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessState extends HomeState {
  Home? homeData;
  SuccessState({this.homeData});
}

class ErrorState extends HomeState {
  Exception? exception;
  ErrorState({this.exception});
}
