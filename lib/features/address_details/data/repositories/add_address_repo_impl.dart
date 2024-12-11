import 'package:flowery_e_commerce/core/networking/common/api_result.dart';

import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';

import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/add_address_repo.dart';
import '../data_sources/contracts/add_address_online_data_source.dart';

@Injectable(as: AddAddressRepo)
class AddAddressRepoImpl implements AddAddressRepo {
  final AddAddressOnlineDataSource _onlineDataSource;

  @factoryMethod
  AddAddressRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request) async {
    return await _onlineDataSource.addAddress(request);
  }
}
