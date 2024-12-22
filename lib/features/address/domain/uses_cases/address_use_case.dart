import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/address/domain/repository/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
 class AddressUseCase{
  AddressRepo addressRepo;

  AddressUseCase(this.addressRepo);

  Future<DataResult<List<AddressesEntity>>> callSavedAddresses(){
    return addressRepo.getSavedAddresses();
  }
}