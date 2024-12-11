import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/repository/addresses_repository.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/usecase/getAddresses_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'getAddresses_usecase_test.mocks.dart';


@GenerateMocks([AddressesRepository])
void main() {
  late GetAddressesUsecase getAddressesUsecase;
  late MockAddressesRepository mockAddressesRepository;
  final dummyaddresses = [  AddressModel(street: "street", phone: "phone", city: "city", id: "id")];
  setUp(() {
    mockAddressesRepository = MockAddressesRepository();
    getAddressesUsecase = GetAddressesUsecase(mockAddressesRepository);


    provideDummy<Result<List<AddressModel>>>(Fail(Exception()));
  });

  group('when calls getAddresses on AddressesRepository Tests', () {
    test('getAddresses returns Success ', () async {



      final successResult = Success(dummyaddresses);


      when(mockAddressesRepository.getAddresses())
          .thenAnswer((_) async => successResult);


      final actual = await getAddressesUsecase.getAddresses();


      expect(actual, successResult);
      verify(mockAddressesRepository.getAddresses()).called(1);
    });

    test('getAddresses returns Fail when repository fails', () async {

      final exception = Exception('Failed to get addresses');
      final failResult = Fail<List<AddressModel>>(exception);


      when(mockAddressesRepository.getAddresses())
          .thenAnswer((_) async => failResult);

      final actual = await getAddressesUsecase.getAddresses();


      expect(actual, failResult);
      verify(mockAddressesRepository.getAddresses()).called(1);
    });
  });
}