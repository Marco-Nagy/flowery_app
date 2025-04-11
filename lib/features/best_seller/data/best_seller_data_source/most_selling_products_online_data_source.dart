import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/best_seller/domain/entities/most_selling_entity.dart';

abstract class MostSellingProductsOnlineDataSource {
  Future<DataResult<List<MostSellingProducts>>> getMostSelling();
}
