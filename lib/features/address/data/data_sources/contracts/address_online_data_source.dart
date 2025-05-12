import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';

abstract class AddressOnlineDataSource {
  Future<DataResult<AddAddressResponseEntity>> addAddress(AddAddressRequestEntity request);

  Future<DataResult<List<AddressesEntity>>> getSavedAddresses();

  Future<DataResult<List<AddressesEntity>>> updateAddress({required String id,required AddAddressRequestEntity request});

  Future<DataResult<List<AddressesEntity>>> deleteAddress({required String id});

}
