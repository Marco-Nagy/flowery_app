import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/response/add_address_response_entity.dart';

part 'add_address_view_model_state.dart';

class AddAddressViewModelCubit extends Cubit<AddAddressViewModelState> {
  AddAddressViewModelCubit() : super(AddAddressViewModelInitial());
}
