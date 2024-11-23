import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/categories_cubit/categories_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeUseCase) : super(CategoriesInitialState());
  final HomeUseCase homeUseCase;

  void getCategories() async {}
  //   emit(GetCategoriesLoadingState());
  //   var response = await homeUseCase.callCategories();
  //   switch (response) {
  //     case Success<List<Category>>():
  //       print("====================${response.data.map(
  //             (e) => e.title,
  //           ).toList()}");
  //       emit(GetCategoriesSuccessState(response.data));
  //     case Fail():
  //       emit(GetCategoriesErrorState(ErrorHandler.handle(response.exception!)));
  //   }
  // }
}
