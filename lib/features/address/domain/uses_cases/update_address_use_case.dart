import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';


@injectable
class UpdateAddressUseCase {
  AddressRepo addressRepo;
  @factoryMethod
  UpdateAddressUseCase(this.addressRepo, );

  Future<DataResult<List<AddressesEntity>>> call(
      {required String id,required AddAddressRequestEntity request}) async =>
      await addressRepo.updateAddress(id: id, request: request);
}
