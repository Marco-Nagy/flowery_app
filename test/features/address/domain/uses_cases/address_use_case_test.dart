import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_e_commerce/features/address/domain/repository/address_repo.dart';
import 'package:flowery_e_commerce/features/address/domain/uses_cases/address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'address_use_case_test.mocks.dart';
@GenerateMocks([AddressRepo])
void main() {
  late MockAddressRepo mockAddressRepo;
  late AddressUseCase addressUseCase;
  setUp((){
   mockAddressRepo = MockAddressRepo();
   addressUseCase = AddressUseCase(mockAddressRepo);
  });
  test('when call get saved addresses use case it should call getSavedAddresses  from addressRepo.grtSavedAddress with correct parameters', () {
    test(
        'when call getSavedAddresses from address online data source it should call apiManager.getSavedAddresses with correct body',
            () async {
          var mockedResult = Success<List<SavedAddressResponseEntityDtoEntity>>(
              [SavedAddressResponseEntityDtoEntity()]);
          provideDummy<DataResult<List<SavedAddressResponseEntityDtoEntity>>>(
              mockedResult);
          when(mockAddressRepo.getSavedAddresses())
              .thenAnswer((_) async => mockedResult);
          var result = await addressUseCase.callSavedAddresses();
          expect(result, mockedResult);
          verify(mockAddressRepo.getSavedAddresses()).called(1);
        });
  });
}