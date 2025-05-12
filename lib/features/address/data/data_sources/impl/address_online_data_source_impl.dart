import 'package:flowery_store/core/networking/api/api_manager.dart';
import 'package:flowery_store/core/networking/api_execute.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_store/features/address/data/mappers/address_mapper.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressOnlineDataSource)
class AddressOnlineDataSourceImpl implements AddressOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  AddressOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<List<AddressesEntity>>> getSavedAddresses() {
    return executeApi(() async {
      var response = await _apiManager.getSavedAddresses();
      return AddressMapper.toSavedAddressesMapper(response);
    });
  }

  @override
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request) {
    return executeApi(() async {
      final response = await _apiManager
          .addAddress(AddressMapper.toAddAddressRequestDto(request));
      return AddressMapper.toAddAddressResponseEntity(response);
    });
  }

  @override
  Future<DataResult<List<AddressesEntity>>> deleteAddress(
      {required String id}) async {
    final response = await _apiManager.deleteAddress(id);
    return executeApi(() async {
      return AddressMapper.toSavedAddressesMapper(response);
    });
  }

  @override
  Future<DataResult<List<AddressesEntity>>> updateAddress(
      {required String id, required AddAddressRequestEntity request}) async {
    final response = await _apiManager.editAddress(
        id, AddressMapper.toAddAddressRequestDto(request));
    return executeApi(() async {
      return AddressMapper.toSavedAddressesMapper(response);
    });
  }
}
