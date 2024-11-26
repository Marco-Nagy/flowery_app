class GetLoggedUserDataResponseEntity {
  final GetLoggedUserDataResponseUserEntity? user;

  GetLoggedUserDataResponseEntity({this.user});
}

class GetLoggedUserDataResponseUserEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;

  GetLoggedUserDataResponseUserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
  });
}
