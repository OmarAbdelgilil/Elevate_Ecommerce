import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/core/cache/shared_preferences_service.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSeller.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/best_seller_product_response/BestSellerProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/ProductResponse.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_best_sellet_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_all_products_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/base/base_states.dart';
import 'package:elevate_ecommerce/features/home/presentation/product_widget/product_view_model/product_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_view_model_test.mocks.dart';

@GenerateMocks([GetAllProductsUseCase, GetAllBestSellerProductsUseCase, SharedPreferencesService])
void main() {
  late ProductViewModel viewModel;
  late MockGetAllProductsUseCase mockGetAllProductsUseCase;
  late MockGetAllBestSellerProductsUseCase mockGetAllBestSellerProductsUseCase;
  late MockSharedPreferencesService mockSharedPreferencesService;

  final dummyProduct = [
    Products(
      id: '1',
      title: 'Test Product',
      price: 1,
    ),
  ];

  final dummyResponse = ProductResponse(
    message: 'Success',
    products: dummyProduct,
  );

  setUp(() {
    mockGetAllProductsUseCase = MockGetAllProductsUseCase();
    mockGetAllBestSellerProductsUseCase = MockGetAllBestSellerProductsUseCase();
    mockSharedPreferencesService = MockSharedPreferencesService();

    when(mockSharedPreferencesService.getCachedProducts())
        .thenAnswer((_) async => null); // Simulate no cached data
    when(mockSharedPreferencesService.cacheProducts(any))
        .thenAnswer((_) async {}); // Simulate caching products

    viewModel = ProductViewModel(
      mockGetAllProductsUseCase,
      mockSharedPreferencesService,
      mockGetAllBestSellerProductsUseCase,
    );

    provideDummy<Result<ProductResponse?>>(Fail(Exception()));
    provideDummy<Result<BestSellerProductResponse?>>(Fail(Exception()));

  });

  group('ProductViewModel Tests', () {
    test('Initial state is InitialState', () {
      expect(viewModel.state, isA<InitialState>());
    });

    test('start() emits LoadingState and ContentState on success', () async {
      // Arrange
      final successResult = Success(dummyResponse);

      when(mockGetAllProductsUseCase.getAllProducts())
          .thenAnswer((_) async => successResult);

      // Assert
      expectLater(
        viewModel.stream,
        emitsInOrder([isA<LoadingState>(), isA<ContentState>()]),
      );

      // Act
      viewModel.start();
    });

    test('start() emits LoadingState and ErrorState on failure', () async {
      // Arrange
      final exception = Exception('Failed to load product details');
      final failResult = Fail<ProductResponse?>(exception);

      when(mockGetAllProductsUseCase.getAllProducts())
          .thenAnswer((_) async => failResult);

      // Assert
      expectLater(
        viewModel.stream,
        emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]),
      );

      // Act
      viewModel.start();
    });

    test('fetchBestSellerProducts() emits LoadingState and ContentState on success', () async {
      // Arrange
      final bestSellerProductList = [
        BestSeller(id: '1', title: 'Best Seller Product', price: 20),
      ];
      final bestSellerResponse = BestSellerProductResponse(
        bestSeller: bestSellerProductList,
      );

      when(mockSharedPreferencesService.getCachedBestSellerProducts())
          .thenAnswer((_) async => null);
      when(mockGetAllBestSellerProductsUseCase.getAllProducts())
          .thenAnswer((_) async => Success(bestSellerResponse));

      // Assert
      expectLater(
        viewModel.stream,
        emitsInOrder([isA<LoadingState>(), isA<ContentState>()]),
      );

      // Act
      await viewModel.fetchBestSellerProducts();
    });
  });
}
