import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/data/data_sources/contracts/product_online_data_source.dart';
import 'package:flowery_e_commerce/features/product/data/repositories/product_repo_impl.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repo_impl_test.mocks.dart';



@GenerateMocks([ProductOnlineDataSource])
void main() {
  late ProductRepoImpl productRepo;
  late MockProductOnlineDataSource mockOnlineDataSource;

  setUp(() {
    mockOnlineDataSource = MockProductOnlineDataSource();
    productRepo = ProductRepoImpl(mockOnlineDataSource);

    provideDummy<DataResult<ProductResponseEntity>>(
          Success(
        ProductResponseEntity(
          products: [],
        ),
      ),
    );
  });

  group('ProductRepoImpl', () {
    test('should return Success<ProductResponseEntity> when API call is successful', () async {
      final responseEntity = ProductResponseEntity(
        products: [
          ProductEntity(
            id: '1',
            title: 'Product 1',
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
      final successResult = Success<ProductResponseEntity>(responseEntity);

      when(mockOnlineDataSource.getAllProducts()).thenAnswer((_) async => successResult);

      final result = await productRepo.getAllProducts();

      expect(result, isA<Success<ProductResponseEntity>>());
      final success = result as Success<ProductResponseEntity>;
      expect(success.data.products.first.id, '1');
      expect(success.data.products.first.title, 'Product 1');
    });

    test('should return Fail when API call fails', () async {
      final failResult = Fail<ProductResponseEntity>(Exception('Error'));

      when(mockOnlineDataSource.getAllProducts()).thenAnswer((_) async => failResult);

      final result = await productRepo.getAllProducts();

      expect(result, isA<Fail<ProductResponseEntity>>());
      final fail = result as Fail<ProductResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception?.toString(), 'Exception: Error');
    });
  });
}
