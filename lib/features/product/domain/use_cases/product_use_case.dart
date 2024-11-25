import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/product_response_entity.dart';
import '../repositories/product_repo.dart';

@injectable
class ProductUseCase {
  final ProductRepo _productsRepo;

  @factoryMethod
  ProductUseCase(this._productsRepo);

  Future<DataResult<ProductResponseEntity>> getAllProducts() =>
      _productsRepo.getAllProducts();
}
