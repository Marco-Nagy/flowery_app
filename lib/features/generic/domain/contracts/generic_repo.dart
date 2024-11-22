
import '../../../../core/networking/common/api_result.dart';
import '../entity/generic_response_entity.dart';

abstract class GenericRepo {
  Future<DataResult<GenericResponseEntity>> getAll(String resourceName);

}
