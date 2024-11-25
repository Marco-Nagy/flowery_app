import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/data/best_seller_data_source/most_selling_products_online_data_source.dart';
import 'package:flowery_e_commerce/features/best_seller/data/mappers/best_seller_mapper.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MostSellingProductsOnlineDataSource)
class MostSellingProductsApiManager
    implements MostSellingProductsOnlineDataSource {
  ApiManager apiManager;
  MostSellingProductsApiManager(this.apiManager);
  @override
  Future<DataResult<List<MostSellingProducts>>> getMostSelling() {
    return executeApi(
      () async {
        var response = await apiManager.getMostSellingProducts();
        return MostSellingMapper.toBestSellerEntity(response);
      },
    );
  }
}
