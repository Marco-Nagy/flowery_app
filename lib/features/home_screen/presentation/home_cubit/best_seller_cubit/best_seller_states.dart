import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/best_seller_entity.dart';

abstract class BestSellerStates{}
class BestSellerInitialState extends BestSellerStates {}

class GetBestSellerLoadingState extends BestSellerStates {}

class GetBestSellerSuccessState extends BestSellerStates {
  final List<BestSeller> bestSeller;

  GetBestSellerSuccessState(this.bestSeller);
}

class GetBestSellerErrorState extends BestSellerStates {
  final ErrorModel errorModel;

  GetBestSellerErrorState(this.errorModel);
}

