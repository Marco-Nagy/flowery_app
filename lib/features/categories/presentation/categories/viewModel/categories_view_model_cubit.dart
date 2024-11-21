import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_view_model_state.dart';

class CategoriesViewModelCubit extends Cubit<CategoriesViewModelState> {
  CategoriesViewModelCubit() : super(CategoriesViewModelInitial());
}
