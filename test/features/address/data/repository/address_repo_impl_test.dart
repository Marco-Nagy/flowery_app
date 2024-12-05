import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_e_commerce/features/address/data/repository/address_repo_impl.dart';
import 'package:flowery_e_commerce/features/address/domain/repository/address_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'address_repo_impl_test.mocks.dart';

@GenerateMocks([AddressOnlineDataSource])
void main() {
  late MockAddressOnlineDataSource mockAddressOnlineDataSource;
  late AddressRepo addressRepo;
  setUp(() {
    mockAddressOnlineDataSource = MockAddressOnlineDataSource();
    addressRepo = AddressRepoImpl(mockAddressOnlineDataSource);
  });
  group(
      'test address online data source when call addressRepo.getSavedAddresses',
      () {
    test(
        'when call addressRepo.getSavedAddresses it should call it from addressOnlineDataSource ',
        () async {
      var mockedResult = Success<List<SavedAddressResponseEntityDtoEntity>>(
          [SavedAddressResponseEntityDtoEntity()]);
      provideDummy<DataResult<List<SavedAddressResponseEntityDtoEntity>>>(
          mockedResult);
      when(mockAddressOnlineDataSource.getSavedAddresses())
          .thenAnswer((_) async => mockedResult);
      var result = await addressRepo.getSavedAddresses();
      expect(result, mockedResult);
      verify(mockAddressOnlineDataSource.getSavedAddresses()).called(1);
    });
  });
}
