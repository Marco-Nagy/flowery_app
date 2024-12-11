import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
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

  @factoryMethod
  AddAddressViewModelCubit(this._addAddressUseCase)
      : super(AddAddressViewModelInitial());

  Future<void> addAddress(AddAddressRequestEntity request) async {
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
}
