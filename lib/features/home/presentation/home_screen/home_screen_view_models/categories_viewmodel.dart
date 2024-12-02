import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewmodel extends Cubit<CategoriesState> {
  final GetCategoriesUsecase _getCategoriesUsecase;
  CategoriesViewmodel(this._getCategoriesUsecase) : super(InitialState());

  void doIntent(CategoriesIntent intent) {
    switch (intent) {
      case LoadCategoriesIntent():
        _getCategories();
        break;
    }
  }

  Future<void> _getCategories() async {
    emit(LoadingState());
    final result = await _getCategoriesUsecase.getCategories();
    switch (result) {
      case Success<Categories?>():
        emit(SuccessState(categories: result.data!.categories));
      case Fail<Categories?>():
        emit(ErrorState(exception: result.exception));
    }
  }
}

sealed class CategoriesIntent {}

class LoadCategoriesIntent extends CategoriesIntent {}

sealed class CategoriesState {}

class InitialState extends CategoriesState {}

class LoadingState extends CategoriesState {}

class SuccessState extends CategoriesState {
  List<CategoryModel>? categories;
  SuccessState({this.categories});
}

class ErrorState extends CategoriesState {
  Exception? exception;
  ErrorState({this.exception});
}
