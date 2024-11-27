sealed class ProfileActions {}

class GetLoggedUserData extends ProfileActions {
  GetLoggedUserData();
}

class EditProfile extends ProfileActions {
  final Map<String, dynamic> profileData;

  EditProfile(this.profileData);
}
