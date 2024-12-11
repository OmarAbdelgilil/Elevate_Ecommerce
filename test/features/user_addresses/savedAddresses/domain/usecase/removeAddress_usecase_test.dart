import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/removeAddress_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'removeAddress_usecase_test.mocks.dart';

@GenerateMocks([AddressesRepository])
void main() {
  late RemoveAddressUsecase removeAddressUsecase;
  late MockAddressesRepository mockAddressesRepository;
  setUp(() {
    mockAddressesRepository = MockAddressesRepository();
    removeAddressUsecase = RemoveAddressUsecase(mockAddressesRepository);

    provideDummy<Result<List<AddressModel>>>(Fail(Exception()));
    provideDummy<Result<bool?>>(Fail(Exception())); 
  });

  group('when calls removeAddress on AddressesRepository Tests', () {
    test('removeAddress returns Success ', () async {



      final successResult = Success<bool?>(true);


      when(mockAddressesRepository.removeAddress("addressId"))
          .thenAnswer((_) async => successResult);


      final actual = await removeAddressUsecase.removeAddress("addressId");


      expect(actual, successResult);
      verify(mockAddressesRepository.removeAddress("addressId")).called(1);
    });

    test('removeAddress returns Fail when repository fails', () async {

      final exception = Exception('Failed to remove address');
      final failResult = Fail<bool?>(exception);


      when(mockAddressesRepository.removeAddress("addressId"))
          .thenAnswer((_) async => failResult);

      final actual = await removeAddressUsecase.removeAddress("addressId");


      expect(actual, failResult);
      verify(mockAddressesRepository.removeAddress("addressId")).called(1);
    });
  });
}