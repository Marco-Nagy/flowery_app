import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';
import 'package:flowery_e_commerce/features/product/domain/repositories/product_repo.dart';
import 'package:flowery_e_commerce/features/product/domain/use_cases/product_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_use_case_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late ProductUseCase productUseCase;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    productUseCase = ProductUseCase(mockProductRepo);

    provideDummy<DataResult<ProductResponseEntity>>(
        Success(
      ProductResponseEntity(
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
      ),
    ));
  });

  group('ProductUseCase Tests', () {
    test('should return Success when repo call is successful', () async {
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

      when(mockProductRepo.getAllProducts()).thenAnswer((_) async => successResult);

      final result = await productUseCase.getAllProducts();

      expect(result, isA<Success<ProductResponseEntity>>());
      final success = result as Success<ProductResponseEntity>;
      expect(success.data.products.first.id, '1');
      expect(success.data.products.first.title, 'Product 1');
      verify(mockProductRepo.getAllProducts()).called(1);
    });

    test('should return Fail when repo call fails', () async {
      final exception = Exception('Error fetching products');
      final failResult = Fail<ProductResponseEntity>(exception);

      when(mockProductRepo.getAllProducts()).thenAnswer((_) async => failResult);

      final result = await productUseCase.getAllProducts();

      expect(result, isA<Fail<ProductResponseEntity>>());
      final fail = result as Fail<ProductResponseEntity>;
      expect(fail.exception, isA<Exception>());
      expect(fail.exception?.toString(), 'Exception: Error fetching products');
      verify(mockProductRepo.getAllProducts()).called(1);
    });
  });
}
