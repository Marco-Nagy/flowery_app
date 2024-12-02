import 'package:equatable/equatable.dart';

class SignUpResponseEntity extends Equatable {
  final String? message;
  final String? error;
  final User? user;
  final String? token;

  const SignUpResponseEntity({
    this.message,
    this.error,
    this.user,
    this.token,
  });

  @override
  List<Object?> get props => [message, error, user, token];
}

class User extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? id;
  final String? createdAt;

  const User({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, gender, phone, photo, role, id, createdAt];
}
