import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/best_seller/domain/entities/most_selling_entity.dart';

sealed class MostSellerStates {}
class MostSellerInitialState extends MostSellerStates {}

class GetMostSellerLoadingState extends MostSellerStates {}

class GetMostSellerSuccessState extends MostSellerStates {
  final List<MostSellingProducts> mostSeller;

  GetMostSellerSuccessState(this.mostSeller);
}

class GetMostSellerErrorState extends MostSellerStates {
  final ErrorModel errorModel;

  GetMostSellerErrorState(this.errorModel);
}

