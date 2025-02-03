import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/product_response_entity.dart';
import '../repositories/product_repo.dart';

@injectable
class SearchProductUseCase {
  final ProductRepo _productsRepo;

  @factoryMethod
  SearchProductUseCase(this._productsRepo);

  Future<DataResult<ProductResponseEntity>> getAllProducts({String? searchKey}) =>
      _productsRepo.getAllProducts(searchKey: searchKey);
}
