import 'package:flowery_e_commerce/features/address_details/domain/contracts/add_address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/request/add_address_request_entity.dart';
import '../entities/response/add_address_response_entity.dart';

@injectable
class AddAddressUseCase {
  final AddAddressRepo _addAddressRepo;

  @factoryMethod
  AddAddressUseCase(this._addAddressRepo);

  Future<DataResult<AddAddressResponseEntity>> addAddress(
          AddAddressRequestEntity request) async =>
      await _addAddressRepo.addAddress(request);
}
