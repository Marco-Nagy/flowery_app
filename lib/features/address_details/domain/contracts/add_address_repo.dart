import '../../../../core/networking/common/api_result.dart';
import '../entities/request/add_address_request_entity.dart';
import '../entities/response/add_address_response_entity.dart';

abstract class AddAddressRepo {
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request);
}
