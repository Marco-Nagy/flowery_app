import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/data/best_seller_data_source/most_selling_products_online_data_source.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/repositories/most_selling_products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MostSellingProductsRepository)
class MostSellingProductsRepoImpl implements MostSellingProductsRepository {
  MostSellingProductsOnlineDataSource mostSellingProductsOnlineDataSource;
  MostSellingProductsRepoImpl(this.mostSellingProductsOnlineDataSource);
  @override
  Future<DataResult<List<MostSellingProducts>>> getMostSellingProducts() {
    return mostSellingProductsOnlineDataSource.getMostSelling();
  }
}
