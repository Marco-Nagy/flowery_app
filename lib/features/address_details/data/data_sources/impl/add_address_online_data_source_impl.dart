import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';

import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';

import 'package:flowery_e_commerce/features/address_details/domain/entities/response/add_address_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../mappers/add_address_mappers.dart';
import '../contracts/add_address_online_data_source.dart';

@Injectable(as: AddAddressOnlineDataSource)
class AddAddressOnlineDataSourceImpl extends AddAddressOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  AddAddressOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<AddAddressResponseEntity>> addAddress(
      AddAddressRequestEntity request) {
    return executeApi(() async {
      final response = await _apiManager
          .addAddress(AddAddressMappers.toAddAddressRequestDto(request));
      return AddAddressMappers.toAddAddressResponseEntity(response);
    });
  }
}
