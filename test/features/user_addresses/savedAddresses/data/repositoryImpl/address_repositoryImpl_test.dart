import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/dataSource/address_OnlineDataSourse.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/data/repositoryImpl/address_repositoryImpl.dart';
import 'package:elevate_ecommerce/features/user_addresses/savedAddresses/domain/model/address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_repositoryImpl_test.mocks.dart';

@GenerateMocks([AddressOnlineDatasource])
void main() {
  late AddressesRepositoryImpl addressesRepositoryImpl;
  late MockAddressOnlineDatasource mockaddressOnlineDatasource;
  final dummyaddresses = [  AddressModel(street: "street", phone: "phone", city: "city", id: "id")];
  setUp(() {
    mockaddressOnlineDatasource = MockAddressOnlineDatasource();
    addressesRepositoryImpl =
        AddressesRepositoryImpl(mockaddressOnlineDatasource);
    provideDummy<Result<List<AddressModel>>>(Fail(Exception()));
    provideDummy<Result<bool?>>(Fail(Exception()));
  });

  group("when calls getAddresses on AddressOnlineDatasource Tests",
          () {
        test('getAddress returns Success ', () async {
          final successResult = Success(dummyaddresses);

          when(mockaddressOnlineDatasource.getAddresses())
              .thenAnswer((_) async => successResult);

          final actual = await addressesRepositoryImpl.getAddresses();

          expect(actual, successResult);
          verify(mockaddressOnlineDatasource.getAddresses())
              .called(1);
        });
        test('getAddress returns Fail', () async {
          final exception = Exception('Failed to get addresses');
          final failResult = Fail<List<AddressModel>>(exception);

          when(mockaddressOnlineDatasource.getAddresses())
              .thenAnswer((_) async => failResult);

          final actual =
          await addressesRepositoryImpl.getAddresses();

          expect(actual, failResult);
          verify(mockaddressOnlineDatasource.getAddresses())
              .called(1);
        });

      });
  group("when calls removeAddress on AddressOnlineDatasource Tests",
      (){
        test('removeAddress returns Success ', () async {

          final successResult = Success<bool?>(true);

          when(mockaddressOnlineDatasource.removeAddress("addressId"))
              .thenAnswer((_) async => successResult);

          final actual =
          await addressesRepositoryImpl.removeAddress('addressId');

          expect(actual, successResult);
          verify(mockaddressOnlineDatasource.removeAddress('addressId'))
              .called(1);
        });
        test('getAddress returns Fail', () async {
          final exception = Exception('Failed to remove address');
          final failResult = Fail<bool?>(exception);

          when(mockaddressOnlineDatasource.removeAddress("addressId"))
              .thenAnswer((_) async => failResult);

          final actual =
          await addressesRepositoryImpl.removeAddress("addressId");

          expect(actual, failResult);
          verify(mockaddressOnlineDatasource.removeAddress("addressId"))
              .called(1);
        });
      }

  );
}
