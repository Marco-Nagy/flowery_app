import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/data/online_data_source/home_online_data_source.dart';
import 'package:flowery_e_commerce/features/home_screen/data/repository_impl/home_repo_impl.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';
@GenerateMocks([HomeOnlineDataSource])
void main() {
  late MockHomeOnlineDataSource homeOnlineDataSource;
  late HomeRepoImpl homeRepoImpl;
  var price = 245;
   setUp(() async {
    homeOnlineDataSource = MockHomeOnlineDataSource();
    homeRepoImpl = HomeRepoImpl(homeOnlineDataSource);
  });
  group('test home online data source when call homeRepository.getCategories or homeRepository.getBestSellers or homeRepository.getOccasions', (){
    test('when call homeRepository.getBestSellers it should call getBestSellers function from homeOnlineDataSource', () async{
      var title = 'GABRIELLE CHANEL';
      var imageCover = 'https://flower.elevateegy.com/uploads/0c6c00d1-d816-44e4-8119-cf97807427f2-cover_image.png';
      var mockedResult = Success<List<BestSeller>>([BestSeller(title: title, imageCover: imageCover, price: price)]);
     provideDummy<DataResult<List<BestSeller>>>(mockedResult);
     when(homeOnlineDataSource.getBestSellers()).thenAnswer((_) async=>mockedResult,);
     var result = await homeRepoImpl.getBestSellers();
     expect(result,mockedResult);
     verify(homeOnlineDataSource.getBestSellers()).called(1);
    });

    test('when call homeRepository.getOccasions it should call getOccasions function from homeOnlineDataSource', () async{
      var name = 'wedding';
      var image = 'https://flower.elevateegy.com/uploads/da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg';
      var mockedResult = Success<List<Occasions>>([Occasions(name: name,image: image)]);
     provideDummy<DataResult<List<Occasions>>>(mockedResult);
     when(homeOnlineDataSource.getOccasions()).thenAnswer((_) async=>mockedResult,);
     var result = await homeRepoImpl.getOccasions();
     expect(result,mockedResult);
     verify(homeOnlineDataSource.getOccasions()).called(1);
    });
  });

}