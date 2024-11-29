import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/uses_cases/home_use_case.dart';
import 'package:flowery_e_commerce/features/home_screen/presentation/home_cubit/best_seller_cubit/best_seller_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class BestSellerCubit extends Cubit<BestSellerStates> {
  BestSellerCubit(this.homeUseCase) : super(BestSellerInitialState());
  final HomeUseCase homeUseCase;
  void getBestSellers() async {
    emit(GetBestSellerLoadingState());
    var response = await homeUseCase.callBestSellers();
    switch (response) {
      case Success<List<BestSeller>>():
        print("====================${response.data.map(
              (e) => e.title,
        ).toList()}");
        emit(GetBestSellerSuccessState(response.data));
      case Fail():
        emit(GetBestSellerErrorState(ErrorHandler.handle(response.exception!)));
    }
  }
}
