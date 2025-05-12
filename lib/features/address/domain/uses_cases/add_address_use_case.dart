import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_store/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';


@injectable
class AddAddressUseCase {
  AddressRepo addressRepo;
  @factoryMethod
  AddAddressUseCase(this.addressRepo, );

  Future<DataResult<AddAddressResponseEntity>> addAddress(
          AddAddressRequestEntity request) async =>
      await addressRepo.addAddress(request);
}
