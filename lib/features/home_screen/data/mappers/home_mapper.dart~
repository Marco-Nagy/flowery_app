import 'package:flowery_e_commerce/features/home_screen/data/models/home_response_model_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';

class HomeMappers {

  static List<BestSeller> toBestSellerEntity(
      HomeResponseModelEntity bestSellerResponse) {
    if (bestSellerResponse.bestSeller == null) return [];
    return bestSellerResponse.bestSeller!
        .map(
          (e) => BestSeller( title: e!.title!, imageCover: e.imgCover!,price: e.price!),
        )
        .toList();
  }
  static List<Occasions> toOccasionsEntity(
      HomeResponseModelEntity bestSellerResponse) {
    if (bestSellerResponse.occasions == null) return [];
    return bestSellerResponse.occasions!
        .map(
          (e) => Occasions(name: e!.name!, image: e.image!)
        )
        .toList();
  }
}
