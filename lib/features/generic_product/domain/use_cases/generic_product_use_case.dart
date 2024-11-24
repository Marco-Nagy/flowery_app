import 'package:flowery_e_commerce/features/generic_product/domain/entities/response/generic_product_response_entity.dart';
import 'package:flowery_e_commerce/features/generic_product/domain/repositories/generic_products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';

@injectable
class GenericProductsUseCase {
  final GenericProductsRepo _productsRepo;

  @factoryMethod
  GenericProductsUseCase(this._productsRepo);

  Future<DataResult<GenericProductResponseEntity>> getAllProducts() =>
      _productsRepo.getAllProducts();
}
