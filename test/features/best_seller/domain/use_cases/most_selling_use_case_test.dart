import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/repositories/most_selling_products_repository.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/use_cases/most_selling_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'most_selling_use_case_test.mocks.dart';
@GenerateMocks([MostSellingProductsRepository])
void main() {
  late MockMostSellingProductsRepository mostSellingProductsRepository;
  late MostSellingProductsUseCase mostSellingProductsUseCase;
  setUp((){
    mostSellingProductsRepository = MockMostSellingProductsRepository();
    mostSellingProductsUseCase = MostSellingProductsUseCase(mostSellingProductsRepository);
  });
  test('when call getMostSellingProducts function it should get it from mostSellingProductsRepository.getMostSellingProducts()', () async{
      var title = 'Wedding Flower';
      var  imageCover = 'https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png';
      var price = 220;
      var priceAfterDiscount = 180;
      var mockedResult = Success<List<MostSellingProducts>>([MostSellingProducts(title: title, imageCover: imageCover, price: price, priceAfterDiscount: priceAfterDiscount)]);
      provideDummy<DataResult<List<MostSellingProducts>>>(mockedResult);
      when(mostSellingProductsRepository.getMostSellingProducts()).thenAnswer((_) async=> mockedResult ,);
      var result = await mostSellingProductsUseCase.call();
      expect(result, mockedResult);
      verify(mostSellingProductsRepository.getMostSellingProducts()).called(1);
    });
}