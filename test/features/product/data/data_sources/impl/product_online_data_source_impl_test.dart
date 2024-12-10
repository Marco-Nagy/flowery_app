import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/data/data_sources/impl/product_online_data_source_impl.dart';
import 'package:flowery_e_commerce/features/product/data/models/response/product_response_dto.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../generic/data/data_sources/impl/generic_online_data_source_impl_test.mocks.dart';



@GenerateMocks([ApiManager])
void main() {
  late ProductOnlineDataSourceImpl dataSource;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = ProductOnlineDataSourceImpl(mockApiManager);
  });

  group('getAllProducts', () {
    test('should return Success when API call is successful', () async {
      final responseDto = ProductResponseDto(
        'Success',
        [
          ProductDto(
            '1',
            'Product',
            'product-1',
            'Product 1 Description',
            'product-1.jpg',
            ['product-1.jpg'],
            100,
            90,
            10,
            'Category 1',
            'Occasion 1',
            '2024-01-01',
            '2024-01-02',
            0,
          ),
        ],
      );

      const expectedEntity = ProductResponseEntity(
        products: [
          ProductEntity(
            id: '1',
            title: 'Product',
            slug: 'product-1',
            description: 'Product 1 Description',
            imgCover: 'product-1.jpg',
            images: ['product-1.jpg'],
            price: 100,
            priceAfterDiscount: 90,
            quantity: 10,
            category: 'Category 1',
            occasion: 'Occasion 1',
          ),
        ],
      );

      when(mockApiManager.getProduct()).thenAnswer((_) async => responseDto);

      final result = await dataSource.getAllProducts();

      expect(result, isA<Success<ProductResponseEntity>>());
      final successResult = result as Success<ProductResponseEntity>;
      expect(successResult.data, expectedEntity);
    });

    test('should return Fail when API call fails', () async {
      when(mockApiManager.getProduct()).thenThrow(Exception(' Error'));

      final result = await dataSource.getAllProducts();

      expect(result, isA<Fail<ProductResponseEntity>>());
      final failResult = result as Fail<ProductResponseEntity>;
      expect(failResult.exception, isA<Exception>());
      expect(failResult.exception?.toString(), 'Exception:  Error');
    });
  });
}
