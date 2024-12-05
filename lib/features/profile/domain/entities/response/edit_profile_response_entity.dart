import 'package:equatable/equatable.dart';

class EditProfileResponseEntity extends Equatable {
  final EditProfileResponseUserEntity? user;

 const EditProfileResponseEntity({this.user});

  @override
  List<Object?> get props => [user];
}

class EditProfileResponseUserEntity extends Equatable{
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;

  const EditProfileResponseUserEntity({
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

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    password,
    gender,
    phone,
    photo,
    role
  ];
}
