import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';


@injectable
class DeleteAddressUseCase {
  AddressRepo addressRepo;
  @factoryMethod
  DeleteAddressUseCase(this.addressRepo, );

  Future<DataResult<List<AddressesEntity>>> call(
      {required String id,}) async =>
      await addressRepo.deleteAddress(id: id, );
}
