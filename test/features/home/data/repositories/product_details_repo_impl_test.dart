import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/data/contracts/product_details_onlinedatasource.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Product_details_response.dart';
import 'package:elevate_ecommerce/features/home/data/models/response/product_response/Products.dart';
import 'package:elevate_ecommerce/features/home/data/repositories/product_details_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_details_repo_impl_test.mocks.dart';

@GenerateMocks([ProductDetails_Onlinedatasource])
void main() {
  late ProductDetailsRepoImpl productDetailsRepoImpl;
  late MockProductDetails_Onlinedatasource mockproductdetailsOnlinedatasource;
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
    mockproductdetailsOnlinedatasource = MockProductDetails_Onlinedatasource();
    productDetailsRepoImpl =
        ProductDetailsRepoImpl(mockproductdetailsOnlinedatasource);
    provideDummy<Result<ProductDetailsResponse?>>(Fail(Exception()));
  });

  group("when calls getProductDetails on ProductDetails_Onlinedatasource Tests",
      () {
    test('getProductDetails returns Success ', () async {
      final successResult = Success(dummyResponse);

      when(mockproductdetailsOnlinedatasource.getProductDetails(any))
          .thenAnswer((_) async => successResult);

      final actual =
          await productDetailsRepoImpl.getProductDetails('productId');

      expect(actual, successResult);
      verify(mockproductdetailsOnlinedatasource.getProductDetails('productId'))
          .called(1);
    });

    test('getProductDetails returns Fail', () async {
      final exception = Exception('Failed to get details');
      final failResult = Fail<ProductDetailsResponse?>(exception);

      when(mockproductdetailsOnlinedatasource.getProductDetails(any))
          .thenAnswer((_) async => failResult);

      final actual =
          await productDetailsRepoImpl.getProductDetails('productId');

      expect(actual, failResult);
      verify(mockproductdetailsOnlinedatasource.getProductDetails('productId'))
          .called(1);
    });
  });
}
