import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address_details/domain/contracts/add_address_repo.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_e_commerce/features/address_details/domain/use_cases/add_address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_address_usecase_test.mocks.dart';

@GenerateMocks([AddAddressRepo])
void main() {
  late MockAddAddressRepo addAddressRepo;
  late AddAddressUseCase addAddressUseCase;

  setUp(() {
    addAddressRepo = MockAddAddressRepo();
    addAddressUseCase = AddAddressUseCase(addAddressRepo);
    provideDummy<DataResult<AddAddressResponseEntity>>(
        Success(AddAddressResponseEntity(address: [
      AddAddressResponseEntityAddress(
          street: 'street', phone: 'phone', city: 'city', id: 'id')
    ])));
  });

  group('test add address use case', () {
    test('should return success when add address is successful', () async {
      var responseEntity = AddAddressResponseEntity(address: [
        AddAddressResponseEntityAddress(
            street: 'street', phone: 'phone', city: 'city', id: 'id')
      ]);

      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');

      var successResult = Success<AddAddressResponseEntity>(responseEntity);

      when(addAddressRepo.addAddress(any))
          .thenAnswer((_) async => successResult);

      var result = await addAddressUseCase.addAddress(requestEntity);

      expect(result, isA<Success<AddAddressResponseEntity>>());

      var success = result as Success<AddAddressResponseEntity>;
      expect(success.data, responseEntity);
      verify(addAddressRepo.addAddress(requestEntity)).called(1);
    });

    test('should return error when add address is unsuccessful', () async {
      var requestEntity = AddAddressRequestEntity(
          street: 'street', city: 'city', phone: 'phone');

      var errorResult = Fail<AddAddressResponseEntity>(Exception('error'));

      when(addAddressRepo.addAddress(any)).thenAnswer((_) async => errorResult);

      var result = await addAddressUseCase.addAddress(requestEntity);

      expect(result, isA<Fail<AddAddressResponseEntity>>());

      var fail = result as Fail<AddAddressResponseEntity>;
      expect(fail.exception, isA<Exception>());
      verify(addAddressRepo.addAddress(requestEntity)).called(1);
    });
  });
}
