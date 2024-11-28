import '../../domain/entities/request/change_password_request_entity.dart';

sealed class ProfileActions {}

class GetLoggedUserData extends ProfileActions {
  GetLoggedUserData();
}

class EditProfile extends ProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}

class ChangePassword extends ProfileActions {
  final ChangePasswordRequestEntity request;

  ChangePassword({required this.request});
}
