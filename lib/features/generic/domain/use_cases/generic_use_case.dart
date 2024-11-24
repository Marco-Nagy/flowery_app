import 'package:flowery_e_commerce/features/generic/domain/contracts/generic_repo.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';

@injectable
class GenericUseCase {
  final GenericRepo _genericRepo;

  @factoryMethod
  GenericUseCase(this._genericRepo);

  Future<DataResult<GenericResponseEntity>> getAllItems(String resourceName) async {
    return await _genericRepo.getAll(resourceName);
  }
}
