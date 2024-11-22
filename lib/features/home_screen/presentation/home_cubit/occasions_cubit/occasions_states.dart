import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/occasions_entity.dart';

abstract class OccasionsStates {}
class OccasionsInitialState extends OccasionsStates {}

class GetOccasionsLoadingState extends OccasionsStates {}

class GetOccasionsSuccessState extends OccasionsStates {
  final List<Occasions> occasions;

  GetOccasionsSuccessState(this.occasions);
}

class GetOccasionsErrorState extends OccasionsStates {
  final ErrorModel errorModel;

  GetOccasionsErrorState(this.errorModel);
}