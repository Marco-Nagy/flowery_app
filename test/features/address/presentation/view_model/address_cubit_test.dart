import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/data/models/response/saved_address_response_entity_dto_entity.dart';
import 'package:flowery_e_commerce/features/address/domain/uses_cases/address_use_case.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'address_cubit_test.mocks.dart';

@GenerateMocks([AddressUseCase])
void main() {
  late MockAddressUseCase mockAddressUseCase;
  late AddressViewModel addressViewModel;
  var message = 'Success';
  var addresses = [];
  setUp(() {
    mockAddressUseCase = MockAddressUseCase();
    addressViewModel = AddressViewModel(mockAddressUseCase);
  });
  blocTest<AddressViewModel, AddressStates>(
    'when call getSavedAddresses  it should call'
    'getSavedAddressesUseCase and change state to success ',
    setUp: () {
      var result = Success<SavedAddressResponseEntityDtoEntity>(
          SavedAddressResponseEntityDtoEntity(message, addresses));
      provideDummy<DataResult<SavedAddressResponseEntityDtoEntity>>(result);
      when(mockAddressUseCase.callSavedAddresses()).thenAnswer(
        (_) async => result,
      );
    },
    build: () {
      return addressViewModel;
    },
    act: (addressViewModel) => addressViewModel.getSavedAddresses(),
    expect: () {
      verify(mockAddressUseCase.callSavedAddresses()).called(1);
      return [
        isA<GetSavedAddressesLoadingState>(),
        isA<GetSavedAddressesSuccessState>()
      ];
    },
  );
  blocTest<AddressViewModel, AddressStates>(
    'when call getSavedAddresses  it should returns fail  it should emit Error state',
    setUp: () {
      var result = Fail<SavedAddressResponseEntityDtoEntity>(Exception());
      provideDummy<DataResult<SavedAddressResponseEntityDtoEntity>>(result);
      when(mockAddressUseCase.callSavedAddresses()).thenAnswer(
        (_) async => result,
      );
    },
    build: () {
      return addressViewModel;
    },
    act: (addressViewModel) => addressViewModel.getSavedAddresses(),
    expect: () {
      verify(mockAddressUseCase.callSavedAddresses()).called(1);
      return [
        isA<GetSavedAddressesLoadingState>(),
        isA<GetSavedAddressesErrorState>(),
      ];
    },
  );
}
