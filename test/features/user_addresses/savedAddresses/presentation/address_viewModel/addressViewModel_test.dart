import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/presentation/address_viewModel/addressViewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'addressViewModel_test.mocks.dart';


@GenerateMocks([GetAddressesUsecase, RemoveAddressUsecase])
void main() {
  late AddressViewModel viewModel;
  late MockGetAddressesUsecase mockGetAddressesUsecase;
  late MockRemoveAddressUsecase mockRemoveAddressUsecase;

  final dummyAddresses = [
    AddressModel(street: "street", phone: "phone", city: "city", id: "id")
  ];

  setUp(() {
    provideDummy<Result<List<AddressModel>>>(Fail(Exception("Dummy exception")));
    provideDummy<Result<bool?>>(Fail(Exception("Dummy exception")));

    mockGetAddressesUsecase = MockGetAddressesUsecase();
    mockRemoveAddressUsecase = MockRemoveAddressUsecase();
    viewModel = AddressViewModel(mockGetAddressesUsecase, mockRemoveAddressUsecase);
  });

  group('AddressViewModel tests', () {
    test('initial state is AddressInitialState', () {
      expect(viewModel.state, isA<AddressInitialState>());
    });

    test(
      'doIntent with LoadAddressIntent emits AddressLoadingState and AddressSuccessState on success',
          () async {
        final successResult = Success(dummyAddresses);
        when(mockGetAddressesUsecase.getAddresses())
            .thenAnswer((_) async => successResult);

        expectLater(
          viewModel.stream,
          emitsInOrder([
            isA<AddressLoadingState>(),
            isA<AddressSuccessState>(),
          ]),
        );

        viewModel.doIntent(LoadAddressIntent());
      },
    );

    test(
      'doIntent with LoadAddressIntent emits AddressLoadingState and AddressErrorState on failure',
          () async {
        final exception = Exception('Failed to load addresses');
        final failResult = Fail<List<AddressModel>>(exception);

        when(mockGetAddressesUsecase.getAddresses())
            .thenAnswer((_) async => failResult);

        expectLater(
          viewModel.stream,
          emitsInOrder([isA<AddressLoadingState>(), isA<AddressErrorState>()]),
        );

        viewModel.doIntent(LoadAddressIntent());
      },
    );

    test(
      'doIntent with RemoveAddressIntent emits AddressRemovedState and updates address list on success',
          () async {
        final removeSuccessResult = Success<bool?>(true);
        final getAddressesSuccessResult = Success(dummyAddresses);

        when(mockRemoveAddressUsecase.removeAddress(any))
            .thenAnswer((_) async => removeSuccessResult);
        when(mockGetAddressesUsecase.getAddresses())
            .thenAnswer((_) async => getAddressesSuccessResult);

        expectLater(
          viewModel.stream,
          emitsInOrder([
            isA<AddressRemovedState>(),
            anyOf(
              isA<AddressSuccessState>(),
              isA<AddressErrorState>(),
            ),
          ]),
        );

        viewModel.doIntent(RemoveAddressIntent("addressId"));
      },
    );


    test(
      'doIntent with RemoveAddressIntent emits AddressRemovedState and AddressErrorState on failure',
          () async {
        final removeFailResult = Fail<bool?>(Exception('Failed to remove address'));

        when(mockRemoveAddressUsecase.removeAddress(any))
            .thenAnswer((_) async => removeFailResult);

        expectLater(
          viewModel.stream,
          emitsInOrder([isA<AddressRemovedState>(), isA<AddressErrorState>()]),
        );

        viewModel.doIntent(RemoveAddressIntent("addressId"));
      },
    );
  });
}