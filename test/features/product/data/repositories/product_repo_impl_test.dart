import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/data/data_sources/contracts/product_online_data_source.dart';
import 'package:flowery_e_commerce/features/product/data/repositories/product_repo_impl.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class MockProductOnlineDataSource extends Mock implements ProductOnlineDataSource {}

void main() {
  late ProductRepoImpl productRepo;
  late MockProductOnlineDataSource mockOnlineDataSource;

  T provideDummy<T>() {
    if (T == DataResult<ProductResponseEntity>) {
      // Manually create a Success result for the missing DataResult<ProductResponseEntity>
      return Success<ProductResponseEntity>(ProductResponseEntity(
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
      )) as T;
    }
    throw Exception('No dummy value for $T');
  }

  // Setup before each test
  setUp(() {
    mockOnlineDataSource = MockProductOnlineDataSource();
    productRepo = ProductRepoImpl(mockOnlineDataSource);

    // Provide dummy values for mock setup
    provideDummy<DataResult<ProductResponseEntity>>();
  });

  group('ProductRepoImpl', () {
    test('should return Success<ProductResponseEntity> when API call is successful', () async {
      // Arrange: Create the response entity
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

      // Manually create a Success result
      final successResult = Success<ProductResponseEntity>(responseEntity);

      // Mock the online data source
      when(mockOnlineDataSource.getAllProducts()).thenAnswer((_) async => successResult);

      // Act: Call the method under test
      final result = await productRepo.getAllProducts();

      // Assert: Check that the result is of type Success and contains the expected data
      expect(result, isA<Success<ProductResponseEntity>>());
      final success = result as Success<ProductResponseEntity>;
      expect(success.data.products.first.id, '1');
      expect(success.data.products.first.title, 'Product 1');
    });

    test('should return Fail<ProductResponseEntity> when API call fails', () async {
      // Arrange: Create a Fail result with an exception
      final failResult = Fail<ProductResponseEntity>(Exception('Error'));

      // Mock the online data source
      when(mockOnlineDataSource.getAllProducts()).thenAnswer((_) async => failResult);

      // Act: Call the method under test
      final result = await productRepo.getAllProducts();

      // Assert: Check that the result is of type Fail and contains the expected exception
      expect(result, isA<Fail<ProductResponseEntity>>());
      final fail = result as Fail<ProductResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception?.toString(), 'Exception: Error');
    });
  });
}

