import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/occasions_cubit/occasions_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class OccasionsCubit extends Cubit<OccasionsStates> {
  OccasionsCubit(this.homeUseCase) : super(OccasionsInitialState());
  final HomeUseCase homeUseCase;
  void getOccasions() async {
    emit(GetOccasionsLoadingState());
    var response = await homeUseCase.callOccasions();
    switch (response) {
      case Success<List<Occasions>>():
        emit(GetOccasionsSuccessState(response.data));
      case Fail():
        emit(GetOccasionsErrorState(ErrorHandler.handle(response.exception!)));
    }
  }
}
