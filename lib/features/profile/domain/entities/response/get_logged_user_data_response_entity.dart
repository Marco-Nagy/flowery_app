import 'package:equatable/equatable.dart';

class GetLoggedUserDataResponseEntity extends Equatable {
  final GetLoggedUserDataResponseUserEntity? user;

  const GetLoggedUserDataResponseEntity({this.user});

  @override
  List<Object?> get props => [user];
}

class GetLoggedUserDataResponseUserEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;

  const GetLoggedUserDataResponseUserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        gender,
        phone,
        photo,
        role
  ];
}
