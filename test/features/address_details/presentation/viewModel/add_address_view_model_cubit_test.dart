import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/core/networking/error/error_model.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_store/features/address/domain/uses_cases/add_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/delete_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/get_saved_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/update_address_use_case.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_action.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_cubit.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_address_view_model_cubit_test.mocks.dart';

@GenerateMocks([
  GetSavedAddressUseCase,
  AddAddressUseCase,
  DeleteAddressUseCase,
  UpdateAddressUseCase
])
void main() {
  late MockAddAddressUseCase useCase;
  late MockGetSavedAddressUseCase getSavedAddressUseCase;
  late MockDeleteAddressUseCase deleteAddressUseCase;
  late MockUpdateAddressUseCase updateAddressUseCase;
  late AddressViewModel viewModel;

  setUp(() {
    useCase = MockAddAddressUseCase();
    getSavedAddressUseCase = MockGetSavedAddressUseCase();
    deleteAddressUseCase = MockDeleteAddressUseCase();
    updateAddressUseCase = MockUpdateAddressUseCase();
    viewModel = AddressViewModel(getSavedAddressUseCase, useCase,
        deleteAddressUseCase, updateAddressUseCase);
    provideDummy<DataResult<AddAddressResponseEntity>>(
        Success(AddAddressResponseEntity(address: [
      AddAddressResponseEntityAddress(
          street: 'street', phone: 'phone', city: 'city', id: 'id')
    ])));
  });

  blocTest<AddressViewModel, AddressStates>(
    'should emit [AddAddressLoading, AddAddressSuccess] when AddAddressSubmitAction is called',
    build: () {
      var successResult =
          Success<AddAddressResponseEntity>(AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]));

      when(useCase.addAddress(any)).thenAnswer((_) async => successResult);
      return viewModel;
    },
    act: (cubit) {
      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');
      return cubit.doAction(AddAddressSubmitAction(requestEntity));
    },
    expect: () => <AddressStates>[
      AddAddressViewModelLoading(),
      AddAddressViewModelSuccess(AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]))
    ],
    verify: (cubit) => verify(useCase.addAddress(any)).called(1),
  );

  blocTest<AddressViewModel, AddressStates>(
    'should emit [AddAddressLoading, AddAddressError] when AddAddressSubmitAction is called',
    build: () {
      when(useCase.addAddress(any)).thenAnswer(
          (_) async => Fail<AddAddressResponseEntity>(Exception('error')));
      return viewModel;
    },
    act: (cubit) {
      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');
      return cubit.doAction(AddAddressSubmitAction(requestEntity));
    },
    expect: () => <AddressStates>[
      AddAddressViewModelLoading(),
      AddAddressViewModelError(const ErrorModel(
          error: 'An unknown error occurred. Please try again.'))
    ],
    verify: (cubit) => verify(useCase.addAddress(any)).called(1),
  );
}
