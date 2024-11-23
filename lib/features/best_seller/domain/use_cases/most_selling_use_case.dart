import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/repositories/most_selling_products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MostSellingProductsUseCase {
  MostSellingProductsRepository mostSellingProductsRepository;
  MostSellingProductsUseCase(this.mostSellingProductsRepository);
  Future<DataResult<List<MostSellingProducts>>> call() {
    return mostSellingProductsRepository.getMostSellingProducts();
  }
}
