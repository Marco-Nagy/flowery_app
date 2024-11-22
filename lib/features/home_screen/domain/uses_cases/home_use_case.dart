import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/categories_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/repository/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
 class HomeUseCase{
  HomeRepository homeRepository;
  HomeUseCase(this.homeRepository);
  // Future<DataResult<List<Category>>> callCategories(){
  //   return homeRepository.getCategories();
  //
  // }
  Future<DataResult<List<BestSeller>>> callBestSellers(){
    return homeRepository.getBestSellers();
  }
  Future<DataResult<List<Occasions>>> callOccasions(){
    return homeRepository.getOccasions();
  }
 }