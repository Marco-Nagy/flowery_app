import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';

abstract class ProfileOnlineDataSource {
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
      String token);
}
