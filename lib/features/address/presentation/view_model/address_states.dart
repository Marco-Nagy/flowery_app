import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:flowery_store/core/networking/error/error_model.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';

sealed class AddressStates {}

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

final class AddAddressViewModelInitial extends AddressStates {}

final class AddAddressViewModelLoading extends AddressStates {}

final class AddAddressViewModelSuccess extends AddressStates {
  final AddAddressResponseEntity response;

  AddAddressViewModelSuccess(this.response);

  List<Object?> get props => [response];
}

final class AddAddressViewModelError extends AddressStates {
  final ErrorModel message;

  AddAddressViewModelError(this.message);

  List<Object?> get props => [message];
}

class AddAddressViewModelFetchedCountries extends AddressStates {
  final List<Country> countries;

  AddAddressViewModelFetchedCountries(this.countries);
}

class AddAddressViewModelFetchedCities extends AddressStates {
  final List<City> cities;

  AddAddressViewModelFetchedCities(this.cities);
}

class DeleteAddressLoadingState extends AddressStates {}

class DeleteAddressSuccessState extends AddressStates {
  final List<AddressesEntity> addresses;

  DeleteAddressSuccessState(this.addresses);
}

class DeleteAddressErrorState extends AddressStates {
  final ErrorModel errorModel;

  DeleteAddressErrorState(this.errorModel);
}

class UpdateAddressLoadingState extends AddressStates {}

class UpdateAddressSuccessState extends AddressStates {
  final List<AddressesEntity> addresses;

  UpdateAddressSuccessState(this.addresses);
}

class UpdateAddressErrorState extends AddressStates {
  final ErrorModel errorModel;

  UpdateAddressErrorState(this.errorModel);
}