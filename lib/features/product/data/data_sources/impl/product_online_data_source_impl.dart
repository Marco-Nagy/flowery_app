import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_respose_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/product_response_entity.dart';
import '../../mappers/product_mappers.dart';
import '../contracts/product_online_data_source.dart';

@Injectable(as: ProductOnlineDataSource)
class ProductOnlineDataSourceImpl implements ProductOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  ProductOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<ProductResponseEntity>> getAllProducts() {
    return executeApi(() async {
      final response = await _apiManager.getProduct();
      return ProductMapper.toEntity(response);
    });
  }
}
