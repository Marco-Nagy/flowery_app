import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic/domain/contracts/generic_repo.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:flowery_e_commerce/features/generic/domain/use_cases/generic_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'generic_use_case_test.mocks.dart';

@GenerateMocks([GenericRepo])
void main() {
  late GenericUseCase useCase;
  late MockGenericRepo mockGenericRepo;


  setUp(() {
    mockGenericRepo = MockGenericRepo();
    useCase = GenericUseCase(mockGenericRepo);

    provideDummy<DataResult<GenericResponseEntity>>(
      Success(
      GenericResponseEntity(
        message: '',
        items: [],
      ),
      ),
    );
  });

  group('getAllItems', () {
    const resourceName = 'occasions';

    test('should return Success when API call is successful', () async {
      final responseEntity = GenericResponseEntity(
        message: 'Success',
        items: [
          Items(
            id: '1',
            name: 'Occasion',
            slug: 'occasion',
            image: 'image.png',
            createdAt: '2024-01-01',
            updatedAt: '2024-01-02',
          ),
        ],
      );
      when(mockGenericRepo.getAll(resourceName))
          .thenAnswer((_) async => Success(responseEntity));

      final result = await useCase.getAllItems('occasions');

      expect(result, isA<Success<GenericResponseEntity>>());
      final successResult = result as Success<GenericResponseEntity>;
      expect(successResult.data.message, 'Success');
      expect(successResult.data.items?.length, 1);
      expect(successResult.data.items?.first.name, 'Occasion');
    });


    test('should return Fail when API call fails', () async {
      when(mockGenericRepo.getAll('occasions'))
          .thenAnswer((_) async => Fail(Exception('Error')));

      final result = await useCase.getAllItems('occasions');

      expect(result, isA<Fail<GenericResponseEntity>>());
      final failResult = result as Fail<GenericResponseEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception?.toString(), 'Exception: Error');
    });

  });
}



