import 'dart:io';

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
class UploadPhoto extends ProfileActions {
  final File photo;

  ChangePassword({required this.request});
  UploadPhoto(this.photo);
}
