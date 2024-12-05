import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_e_commerce/features/address/data/data_sources/impl/address_online_data_source_impl.dart';
import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/data_sources/impl/auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late AddressOnlineDataSource addressOnlineDataSource;
  setUp(() {
    mockApiManager = MockApiManager();
    addressOnlineDataSource = AddressOnlineDataSourceImpl(mockApiManager);
  });
  group('when call getSavedAddresses it should get it from ApiManager', () {
    test(
        'when call getSavedAddresses from address online data source it should call apiManager.getSavedAddresses with correct body',
        () async {
      var mockedResult = Success<List<SavedAddressResponseEntityDtoEntity>>(
          [SavedAddressResponseEntityDtoEntity()]);
      provideDummy<DataResult<List<SavedAddressResponseEntityDtoEntity>>>(
          mockedResult);
      when(mockApiManager.getSavedAddresses())
          .thenAnswer((_) async => mockedResult);
      var result = await addressOnlineDataSource.getSavedAddresses();
      expect(result, mockedResult);
      verify(mockApiManager.getSavedAddresses()).called(1);
    });
  });
}
