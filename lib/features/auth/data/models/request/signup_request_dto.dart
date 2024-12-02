import 'package:json_annotation/json_annotation.dart';

part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "gender")
  final String? gender;

  SignUpRequestDto ({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
    this.gender,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) {
    return _$SignUpRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpRequestDtoToJson(this);
  }



}


