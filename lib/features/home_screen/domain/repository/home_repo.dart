import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';

abstract class HomeRepository {
  Future<DataResult<List<BestSeller>>> getBestSellers();
  Future<DataResult<List<Occasions>>> getOccasions();
}
