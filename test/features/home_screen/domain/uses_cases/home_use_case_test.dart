import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/repository/home_repo.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_use_case_test.mocks.dart';
@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository homeRepo;
  late HomeUseCase homeUseCase;
  setUp(()async {
    homeRepo = MockHomeRepository();
    homeUseCase = HomeUseCase(homeRepo);
  });
  group('when call getCategories or getBestSellers or and getOccasions it should call them from homeRepository with success result',(){
    test('when call (callBestSellers method) it should get homeRepository.getBestSellers with success result', ()async {
      var title = 'Wedding Flower';
      var  imageCover = 'https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png';
      var price = 220;
      var mockedResult = Success<List<BestSeller>>([BestSeller(title: title, imageCover: imageCover, price: price)]);
      provideDummy<DataResult<List<BestSeller>>>(mockedResult);
      when(homeRepo.getBestSellers()).thenAnswer((_) async=> mockedResult ,);
      var result = await homeUseCase.callBestSellers();
      expect(result, mockedResult);
      verify(homeRepo.getBestSellers()).called(1);
    });
    test('when call (callOccasions method) it should get homeRepository.getOccasions with  success result', ()async {
      homeRepo = MockHomeRepository();
      homeUseCase = HomeUseCase(homeRepo);
      var name = 'Wedding';
      var  image = 'https://flower.elevateegy.com/uploads/da6919e9-6d7b-4e1e-9578-1c5b6fd098b2-sofia-hernandez-8cCfjxR8KTw-unsplash.jpg';
      var mockedResult = Success<List<Occasions>>([Occasions(name: name, image: image)]);
      provideDummy<DataResult<List<Occasions>>>(mockedResult);
      when(homeRepo.getOccasions()).thenAnswer((_) async=> mockedResult ,);
      var result = await homeUseCase.callOccasions();
      expect(result, mockedResult);
      verify(homeRepo.getOccasions()).called(1);
    });

  } );
}