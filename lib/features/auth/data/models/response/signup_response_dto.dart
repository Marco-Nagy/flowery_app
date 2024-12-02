import 'package:json_annotation/json_annotation.dart';

part 'signup_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "error")
  final String? error;
  @JsonKey(name: "user")
  final UserDto? user;
  @JsonKey(name: "token")
  final String? token;

  SignUpResponseDto({
    this.message,
    this.user,
    this.token,
    this.error,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpResponseDtoToJson(this);
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto({
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

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
}
