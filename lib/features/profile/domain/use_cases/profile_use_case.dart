import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_logged_user_data_response_entity.dart';

@injectable
class ProfileUseCase {
  final ProfileRepo _repository;

  @factoryMethod
  ProfileUseCase(this._repository);

  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
          String token) =>
      _repository.getProfileData(token);
}
