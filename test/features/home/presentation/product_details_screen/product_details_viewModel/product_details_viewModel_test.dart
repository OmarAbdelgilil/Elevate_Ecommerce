import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/product_details_useCase.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_details_screen/product_details_viewModel/product_details_viewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_viewModel_test.mocks.dart';

@GenerateMocks([ProductDetailsUsecase])
void main() {
  late ProductDetails_ViewModel viewmodel;
  late MockProductDetailsUsecase mockProductDetailsUsecase;

  final dummyProduct = Products(
    id: '1',
    title: 'Test Product',
    price: 100,
  );

  final dummyResponse = ProductDetailsResponse(
    message: 'Success',
    product: dummyProduct,
  );

  setUp(() {
    provideDummy<Result<ProductDetailsResponse?>>(
      Fail<ProductDetailsResponse?>(Exception("Dummy exception")),
    );

    mockProductDetailsUsecase = MockProductDetailsUsecase();
    viewmodel = ProductDetails_ViewModel(mockProductDetailsUsecase);
  });

  group('ProductDetails_ViewModel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with LoadProductDetailsIntent emits LoadingState, SuccessState on Success',
      () async {
        final successResult = Success(dummyResponse);

        when(mockProductDetailsUsecase.getProductDetails(any))
            .thenAnswer((_) async => successResult);

        expectLater(
          viewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessState>(),
          ]),
        );

        viewmodel.doIntent(LoadProductDetailsIntent("00000"));
      },
    );

    test(
      'doIntent with LoadProductDetailsIntent emits LoadingState, ErrorState on Fail',
      () async {
        final exception = Exception('Failed to load product details');

        final failResult = Fail<ProductDetailsResponse?>(exception);

        when(mockProductDetailsUsecase.getProductDetails(any))
            .thenAnswer((_) async => failResult);

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
        );

        viewmodel.doIntent(LoadProductDetailsIntent("00000"));
      },
    );
  });
}
