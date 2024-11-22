import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/data/mappers/home_mapper.dart';
import 'package:flowery_e_commerce/features/home_screen/data/online_data_source/home_online_data_source.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/categories_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: HomeOnlineDataSource)
class HomeApiManager implements HomeOnlineDataSource {
  ApiManager apiManager;
  HomeApiManager(this.apiManager);
  @override
  Future<DataResult<List<BestSeller>>> getBestSellers() {
    return executeApi(() async{
      var response = await apiManager.getHome();
      return HomeMappers.toBestSellerEntity(response);
    },);
  }

  @override
  Future<DataResult<List<Category>>> getCategories() {
    return executeApi(() {
      return Future.delayed(Duration(milliseconds: 5));
    },);
    // return executeApi(() async{
    //   var response = await apiManager.getHome();
    //   return HomeMappers.toCategoriesEntity(response);
    // },);
  }

  @override
  Future<DataResult<List<Occasions>>> getOccasions() {
    return executeApi(() async{
      var response = await apiManager.getHome();
      return HomeMappers.toOccasionsEntity(response);
    },);
  }


}
