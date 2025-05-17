import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_store/features/address/domain/repository/address_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepo)
class AddressRepoImpl implements AddressRepo {
  AddressOnlineDataSource addressOnlineDataSource;

  AddressRepoImpl(this.addressOnlineDataSource);

  @override
  Future<DataResult<List<AddressesEntity>>> getSavedAddresses() {
    return addressOnlineDataSource.getSavedAddresses();
  }

  @override
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request) async {
    return await addressOnlineDataSource.addAddress(request);
  }

  @override
  Future<DataResult<List<AddressesEntity>>> deleteAddress(
      {required String id}) async {
    return await addressOnlineDataSource.deleteAddress(id: id);
  }

  @override
  Future<DataResult<List<AddressesEntity>>> updateAddress(
      {required String id, required AddAddressRequestEntity request}) async{
    return await addressOnlineDataSource.updateAddress(id: id, request: request);
  }
}
