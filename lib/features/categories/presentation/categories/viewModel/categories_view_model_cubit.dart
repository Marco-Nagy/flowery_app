import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/error/error_model.dart';
import '../../../domain/entities/response/get_all_categories_response_entity.dart';

part 'categories_view_model_state.dart';

class CategoriesViewModelCubit extends Cubit<CategoriesViewModelState> {
  CategoriesViewModelCubit() : super(CategoriesViewModelInitial());
}
