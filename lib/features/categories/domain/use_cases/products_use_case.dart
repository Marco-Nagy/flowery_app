import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_products_response_entity.dart';
import 'package:flowery_e_commerce/features/categories/domain/repositories/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';

@injectable
class ProductsUseCase {
  final ProductsRepo _productsRepo;

  @factoryMethod
  ProductsUseCase(this._productsRepo);

  Future<DataResult<GetAllProductsRsponseEntity>> getAllProducts() =>
      _productsRepo.getAllProducts();
}
