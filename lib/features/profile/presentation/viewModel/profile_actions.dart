import 'dart:io';

sealed class ProfileActions {}

class GetLoggedUserData extends ProfileActions {
  GetLoggedUserData();
}

class EditProfile extends ProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}

class UploadPhoto extends ProfileActions {
  final File photo;

  UploadPhoto(this.photo);
}
