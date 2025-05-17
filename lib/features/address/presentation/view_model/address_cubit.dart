import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/core/networking/error/error_handler.dart';
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/address/domain/entities/response/add_address_response_entity.dart';
import 'package:flowery_store/features/address/domain/uses_cases/add_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/delete_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/get_saved_address_use_case.dart';
import 'package:flowery_store/features/address/domain/uses_cases/update_address_use_case.dart';
import 'package:flowery_store/features/address/presentation/view_model/address_states.dart';
import 'package:injectable/injectable.dart';

import 'address_action.dart';

@injectable
class AddressViewModel extends Cubit<AddressStates> {
  AddressViewModel(
    this.getSavedAddressUseCase,
    this._addAddressUseCase,
    this._deleteAddressUseCase,
    this._updateAddressUseCase,
  ) : super(GetSavedAddressesInitialState());
  final GetSavedAddressUseCase getSavedAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;

  final UpdateAddressUseCase _updateAddressUseCase;

  List<Country> countryList = [];
  List<City> cityList = [];

  void doAction(AddressAction action) {
    switch (action) {
      case AddAddressSubmitAction():
        _addAddress(action.request);
        break;
      case FetchCountriesAction():
        _fetchCountries();
        break;
      case FetchCitiesAction():
        _fetchCities(action.countryCode);
        break;
      case FetchSavedAddressesAction():
        _getSavedAddresses();
        break;
      case UpdateAddressAction():
       _updateAddress (action.addressId,action.body);

      case DeleteAddressAction():
        _deleteAddress(action.addressId);
    }
  }

  Future<void> _addAddress(AddAddressRequestEntity request) async {
    emit(AddAddressViewModelLoading());
    final result = await _addAddressUseCase.addAddress(request);
    switch (result) {
      case Success<AddAddressResponseEntity>():
        emit(AddAddressViewModelSuccess(result.data));
        break;
      case Fail<AddAddressResponseEntity>():
        emit(AddAddressViewModelError(ErrorHandler.handle(result.exception!)));
        break;
    }
  }

  Future<void> _fetchCountries() async {
    try {
      final countries =
          await getAllCountries(); // Replace with your actual use case
      countryList = countries;
      emit(AddAddressViewModelFetchedCountries(countries));
    } on Exception catch (e) {
      emit(AddAddressViewModelError(ErrorHandler.handle(e)));
    }
  }

  Future<void> _fetchCities(String countryCode) async {
    try {
      final cities =
          await getCountryCities(countryCode); // Replace with actual use case
      cityList = cities;
      emit(AddAddressViewModelFetchedCities(cities));
    } on Exception catch (e) {
      emit(AddAddressViewModelError(ErrorHandler.handle(e)));
    }
  }

  void _getSavedAddresses() async {
    emit(GetSavedAddressesLoadingState());
    var response = await getSavedAddressUseCase();
    switch (response) {
      case Success<List<AddressesEntity>>():
        emit(GetSavedAddressesSuccessState(response.data));
      case Fail():
        emit(GetSavedAddressesErrorState(
            ErrorHandler.handle(response.exception!)));
    }
  }

  void _deleteAddress(String addressId) async {
    emit(DeleteAddressLoadingState());
    var response = await _deleteAddressUseCase(id: addressId);
    switch (response) {
      case Success<List<AddressesEntity>>():
        emit(DeleteAddressSuccessState(response.data));
      case Fail():
        emit(DeleteAddressErrorState(ErrorHandler.handle(response.exception!)));
    }
  }

  void _updateAddress(String addressId, AddAddressRequestEntity request) async {
    emit(UpdateAddressLoadingState());
    var response = await _updateAddressUseCase(id: addressId, request: request);
    switch (response) {
      case Success<List<AddressesEntity>>():
        emit(UpdateAddressSuccessState(response.data));
      case Fail():
        emit(UpdateAddressErrorState(ErrorHandler.handle(response.exception!)));
    }
  }
}
