import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/address_details/presentation/viewModel/add_address_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/error/error_handler.dart';
import '../../domain/entities/request/add_address_request_entity.dart';
import '../../domain/entities/response/add_address_response_entity.dart';
import '../../domain/use_cases/add_address_usecase.dart';

part 'add_address_view_model_state.dart';

@injectable
class AddAddressViewModelCubit extends Cubit<AddAddressViewModelState> {
  final AddAddressUseCase _addAddressUseCase;
  List<Country> countryList = [];
  List<City> cityList = [];
  @factoryMethod
  AddAddressViewModelCubit(this._addAddressUseCase)
      : super(AddAddressViewModelInitial());

  void doAction(AddAddressAction action) {
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
}
