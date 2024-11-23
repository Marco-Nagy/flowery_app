
 import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';

abstract class MostSellingProductsRepository{
  Future<DataResult<List<MostSellingProducts>>> getMostSellingProducts();
 }