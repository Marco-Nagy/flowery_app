class EditProfileResponseEntity {
  final EditProfileResponseUserEntity? user;

  EditProfileResponseEntity({this.user});
}

class EditProfileResponseUserEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;

  EditProfileResponseUserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
  });
}
