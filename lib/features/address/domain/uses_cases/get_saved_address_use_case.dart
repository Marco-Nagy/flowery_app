import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
 class GetSavedAddressUseCase{
  AddressRepo addressRepo;

  GetSavedAddressUseCase(this.addressRepo);

  Future<DataResult<List<AddressesEntity>>> call(){
    return addressRepo.getSavedAddresses();
  }
}