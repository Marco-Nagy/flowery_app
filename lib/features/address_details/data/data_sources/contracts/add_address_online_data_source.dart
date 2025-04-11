import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address_details/domain/entities/response/add_address_response_entity.dart';

abstract class AddAddressOnlineDataSource {
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request);
}
