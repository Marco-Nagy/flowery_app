import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/address/domain/uses_cases/address_use_case.dart';
import 'package:flowery_e_commerce/features/address/presentation/view_model/address_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressViewModel extends Cubit<AddressStates> {
  AddressViewModel(this.addressUseCase)
      : super(GetSavedAddressesInitialState());
  final AddressUseCase addressUseCase;
  void getSavedAddresses() async {
    emit(GetSavedAddressesLoadingState());
    var response = await addressUseCase.callSavedAddresses();
    switch (response) {
      case Success<List<AddressesEntity>>():
        emit(GetSavedAddressesSuccessState(response.data));
      case Fail():
        emit(GetSavedAddressesErrorState(
            ErrorHandler.handle(response.exception!)));
    }
  }
}
