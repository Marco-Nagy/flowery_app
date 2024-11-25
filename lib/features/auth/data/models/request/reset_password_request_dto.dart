import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  final String? email;
  final String? newPassword;

  ResetPasswordRequestDto({this.email, this.newPassword});

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);
}
