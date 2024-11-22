import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entity/generic_response_entity.dart';

abstract class GenericOnlineDataSource {
  Future<DataResult<GenericResponseEntity>> getAll(String resourceName);
}
