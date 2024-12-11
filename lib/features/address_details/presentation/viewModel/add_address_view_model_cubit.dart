import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_address_view_model_state.dart';

class AddAddressViewModelCubit extends Cubit<AddAddressViewModelState> {
  AddAddressViewModelCubit() : super(AddAddressViewModelInitial());
}
