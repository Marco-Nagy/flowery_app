import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address_details/data/data_sources/contracts/add_address_online_data_source.dart';
import 'package:flowery_e_commerce/features/address_details/data/repositories/add_address_repo_impl.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_address_repo_impl_test.mocks.dart';

@GenerateMocks([AddAddressOnlineDataSource])
void main() {
  late var dataSource;
  late var addAddressRepoImpl;

  setUp(() {
    dataSource = MockAddAddressOnlineDataSource();
    addAddressRepoImpl = AddAddressRepoImpl(dataSource);
    provideDummy<DataResult<AddAddressResponseEntity>>(
        Success(AddAddressResponseEntity(address: [
      AddAddressResponseEntityAddress(
          street: 'street', phone: 'phone', city: 'city', id: 'id')
    ])));
  });

  group('test add address repo impl', () {
    test('should return success when add address is successful', () async {
      var responseEntity = AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]);

      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');
      var successResult = Success<AddAddressResponseEntity>(responseEntity);

      when(dataSource.addAddress(any)).thenAnswer((_) async => successResult);

      var result = await addAddressRepoImpl.addAddress(requestEntity);

      expect(result, isA<Success<AddAddressResponseEntity>>());

      var success = result as Success<AddAddressResponseEntity>;
      expect(success.data, responseEntity);
    });
    test('should return fail when add address is not successful', () async {
      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');
      var exception = Exception('error');
      var failResult = Fail<AddAddressResponseEntity>(exception);
      when(dataSource.addAddress(any)).thenAnswer((_) async => failResult);
      var result = await addAddressRepoImpl.addAddress(requestEntity);
      expect(result, isA<Fail<AddAddressResponseEntity>>());
      var fail = result as Fail<AddAddressResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception.toString(), 'Exception: error');
      verify(dataSource.addAddress(requestEntity)).called(1);
    });
  });
}
