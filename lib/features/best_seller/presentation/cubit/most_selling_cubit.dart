import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/use_cases/most_selling_use_case.dart';
import 'package:flowery_e_commerce/features/best_seller/presentation/cubit/most_seller_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class MostSellerCubit extends Cubit<MostSellerStates> {
  MostSellerCubit(this.mostSellingProductsUseCase) : super(MostSellerInitialState());
  final MostSellingProductsUseCase mostSellingProductsUseCase;
  void getMostSellers() async {
    emit(GetMostSellerLoadingState());
    var response = await mostSellingProductsUseCase.call();
    switch (response) {
      case Success<List<MostSellingProducts>>():
        emit(GetMostSellerSuccessState(response.data));
      case Fail():
        emit(GetMostSellerErrorState(ErrorHandler.handle(response.exception!)));
    }
  }
}
