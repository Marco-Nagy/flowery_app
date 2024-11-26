import '../../../../core/networking/common/api_result.dart';
import '../entities/response/edit_profile_response_entity.dart';
import '../entities/response/get_logged_user_data_response_entity.dart';

abstract class ProfileRepo {
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
      String token);

  Future<DataResult<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData);
}
