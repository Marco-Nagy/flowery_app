import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/data/online_data_source/home_online_data_source.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/categories_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/repository/home_repo.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: HomeRepository)
class HomeRepoImpl implements HomeRepository {
 HomeOnlineDataSource homeOnlineDataSource;
 HomeRepoImpl(this.homeOnlineDataSource);
  @override
  Future<DataResult<List<BestSeller>>> getBestSellers() {
    return homeOnlineDataSource.getBestSellers();
  }

  // @override
  // Future<DataResult<List<Category>>> getCategories() {
  //   return homeOnlineDataSource.getCategories();
  // }

  @override
  Future<DataResult<List<Occasions>>> getOccasions() {
    return homeOnlineDataSource.getOccasions();
  }
}
