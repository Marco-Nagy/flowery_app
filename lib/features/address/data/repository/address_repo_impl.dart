import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/data/data_sources/contracts/address_online_data_source.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepo)
class AddressRepoImpl implements AddressRepo {
  AddressOnlineDataSource addressOnlineDataSource;

  AddressRepoImpl(this.addressOnlineDataSource);

  @override
  Future<DataResult<List<GetSavedAddressesEntity>>> getSavedAddresses() {
    return addressOnlineDataSource.getSavedAddresses();
  }
}
