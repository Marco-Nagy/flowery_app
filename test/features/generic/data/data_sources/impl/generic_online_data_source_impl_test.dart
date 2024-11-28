import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic/data/data_sources/impl/generic_online_data_source_impl.dart';
import 'package:flowery_e_commerce/features/generic/data/models/generic_response_dto.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/data_sources/impl/auth_online_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late GenericOnlineDataSourceImpl dataSource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = GenericOnlineDataSourceImpl(mockApiManager);
  });

  group('getAll', () {
    const resourceName = 'occasions';

    test('should return GenericResponseEntity when API call is successful',
        () async {
      final responseDto = GenericResponseDto(
        message: 'Success',
        occasions: [
          ItemModel(
            Id: '1',
            name: 'Occasion',
            slug: 'occasion',
            image: 'image.png',
            createdAt: '2024-01-01',
            updatedAt: '2024-01-02',
          )
        ],
      );
      when(mockApiManager.getGenericProduct(resourceName))
          .thenAnswer((_) async => responseDto);

      final result = await dataSource.getAll(resourceName);

      expect(result, isA<Success<GenericResponseEntity>>());
      final successResult = result as Success<GenericResponseEntity>;
      expect(successResult.data.message, 'Success');
    });

    test('should return Fail when API call fails', () async {
      when(mockApiManager.getGenericProduct(resourceName))
          .thenThrow(Exception('Error'));

      final result = await dataSource.getAll(resourceName);

      expect(result, isA<Fail<GenericResponseEntity>>());
      final failResult = result as Fail<GenericResponseEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception?.toString(), 'Exception: Error');
    });
  });
}
