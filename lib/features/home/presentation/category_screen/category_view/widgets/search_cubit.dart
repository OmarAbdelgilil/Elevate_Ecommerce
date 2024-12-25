import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Define the Search Intent
sealed class SearchIntent {}

class LoadSearchResultsIntent extends SearchIntent {
  final String keyword;

  LoadSearchResultsIntent(this.keyword);
}

// Define the Search State
sealed class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class SuccessState extends SearchState {
  final List<Products>? products;

  SuccessState({this.products});
}

class ErrorState extends SearchState {
  final Exception? exception;

  ErrorState({this.exception});
}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final GetAllProductsUseCase _getAllProductsUseCase;

  SearchCubit(this._getAllProductsUseCase) : super(InitialState());

  void doIntent(SearchIntent intent) {
    switch (intent.runtimeType) {
      case LoadSearchResultsIntent:
        _loadSearchResults((intent as LoadSearchResultsIntent).keyword);
        break;
    }
  }

  Future<void> _loadSearchResults(String keyword) async {
    emit(LoadingState());
    final result =
        await _getAllProductsUseCase.getAllProducts(keyword: keyword);
    switch (result) {
      case Success<ProductResponse?>():
        emit(SuccessState(products: result.data?.products));
      case Fail<ProductResponse?>():
        emit(ErrorState(exception: result.exception));
    }
  }
}
