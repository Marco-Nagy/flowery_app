import 'package:bloc_test/bloc_test.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/use_cases/add_address_usecase.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_action.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_address_view_model_cubit_test.mocks.dart';

@GenerateMocks([AddAddressUseCase])
void main() {
  late MockAddAddressUseCase useCase;
  late AddAddressViewModelCubit viewModel;

  setUp(() {
    useCase = MockAddAddressUseCase();
    viewModel = AddAddressViewModelCubit(useCase);
    provideDummy<DataResult<AddAddressResponseEntity>>(
        Success(AddAddressResponseEntity(address: [
      AddAddressResponseEntityAddress(
          street: 'street', phone: 'phone', city: 'city', id: 'id')
    ])));
  });

  blocTest<AddAddressViewModelCubit, AddAddressViewModelState>(
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
    expect: () => <AddAddressViewModelState>[
      AddAddressViewModelLoading(),
      AddAddressViewModelSuccess(AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]))
    ],
    verify: (cubit) => verify(useCase.addAddress(any)).called(1),
  );

  blocTest<AddAddressViewModelCubit, AddAddressViewModelState>(
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
    expect: () => <AddAddressViewModelState>[
      AddAddressViewModelLoading(),
      AddAddressViewModelError(const ErrorModel(
          error: 'An unknown error occurred. Please try again.'))
    ],
    verify: (cubit) => verify(useCase.addAddress(any)).called(1),
  );
}
