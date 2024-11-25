import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/data/best_seller_data_source/most_selling_products_online_data_source.dart';
import 'package:flowery_e_commerce/features/best_seller/data/repo_impl/most_selling_repo_impl.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'most_selling_repo_impl_test.mocks.dart';
@GenerateMocks([MostSellingProductsOnlineDataSource])
void main() {
  late MockMostSellingProductsOnlineDataSource mostSellingOnlineDataSource;
  late MostSellingProductsRepoImpl mostSellingProductsRepoImpl;
  var price = 245;
  setUp(() async {
    mostSellingOnlineDataSource = MockMostSellingProductsOnlineDataSource();
    mostSellingProductsRepoImpl = MostSellingProductsRepoImpl(mostSellingOnlineDataSource);
  });
  test('when call mostSellingProductsRepository.getMostSellingProducts it should call getMostSellingProducts function from MostSellingProductsOnlineDataSource', () async{
    var title = 'GABRIELLE CHANEL';
    var imageCover = 'https://flower.elevateegy.com/uploads/0c6c00d1-d816-44e4-8119-cf97807427f2-cover_image.png';
    var price = 220;
    var priceAfterDiscount = 180;
    var mockedResult = Success<List<MostSellingProducts>>([MostSellingProducts(title: title, imageCover: imageCover, price: price, priceAfterDiscount: priceAfterDiscount)]);
    provideDummy<DataResult<List<MostSellingProducts>>>(mockedResult);
    when(mostSellingOnlineDataSource.getMostSelling()).thenAnswer((_) async=>mockedResult,);
    var result = await mostSellingProductsRepoImpl.getMostSellingProducts();
    expect(result,mockedResult);
    verify(mostSellingOnlineDataSource.getMostSelling()).called(1);
  });
}