import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/edit_profile_response_entity.dart';
import '../entities/response/get_logged_user_data_response_entity.dart';

@injectable
class ProfileUseCase {
  final ProfileRepo _repository;

  @factoryMethod
  ProfileUseCase(this._repository);

  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
          String token) =>
      _repository.getProfileData(token);

  Future<DataResult<EditProfileResponseEntity>> editProfile(
          String token, Map<String, dynamic> profileData) =>
      _repository.editProfile(token, profileData);
}
