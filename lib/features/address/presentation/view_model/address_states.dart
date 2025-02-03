import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

sealed class AddressStates{}
class GetSavedAddressesInitialState extends AddressStates {}

class GetSavedAddressesLoadingState extends AddressStates {}

class GetSavedAddressesSuccessState extends AddressStates {
  final List<AddressesEntity> addresses;

  GetSavedAddressesSuccessState(this.addresses);
}

class GetSavedAddressesErrorState extends AddressStates {
  final ErrorModel errorModel;

  GetSavedAddressesErrorState(this.errorModel);
}

