import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_store/features/home_screen/domain/entities/occasions_entity.dart';

abstract class HomeOnlineDataSource {
  Future<DataResult<List<BestSeller>>> getBestSellers();
  Future<DataResult<List<Occasions>>> getOccasions();
}
