import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address_details/data/data_sources/impl/add_address_online_data_source_impl.dart';
import 'package:flowery_e_commerce/features/address_details/data/models/response/add_address_response_dto.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/data_sources/impl/auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late AddAddressOnlineDataSourceImpl dataSource;
  late MockApiManager apiManager;

  setUp(() {
    apiManager = MockApiManager();
    dataSource = AddAddressOnlineDataSourceImpl(apiManager);
  });

  group('add address online data source impl testing', () {
    test('should return success when add address is successful', () async {
      var responseDto = AddAddressResponseDto('success',
          [AddAddressResponseDtoAddress('street', 'phone', 'city', 'id')]);

      var responseEntity = AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]);

      var request = AddAddressRequestEntity(
          phone: 'phone', street: 'street', city: 'city');
      when(apiManager.addAddress(any)).thenAnswer((_) async => responseDto);
      var result = await dataSource.addAddress(request);
      expect(result, isA<Success<AddAddressResponseEntity>>());
      var successfulResult = result as Success<AddAddressResponseEntity>;
      expect(successfulResult.data, responseEntity);
    });
    test('should return fail when add address is not successful', () async {
      var request = AddAddressRequestEntity(
          phone: 'phone', street: 'street', city: 'city');
      var exception = Exception('error');
      when(apiManager.addAddress(any)).thenThrow(exception);
      var result = await dataSource.addAddress(request);
      expect(result, isA<Fail<AddAddressResponseEntity>>());
      var failResult = result as Fail<AddAddressResponseEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception.toString(), 'Exception: error');
    });
  });
}
