import 'package:flowery_store/core/networking/api/api_manager.dart';
import 'package:flowery_store/core/networking/api_execute.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_store/features/address/data/mappers/address_mapper.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
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
}
