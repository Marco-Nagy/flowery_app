import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request_dto.g.dart';

@JsonSerializable()
class ResetPasswordRequestDto {
  final String? email;
  final String? newPassword;

  ResetPasswordRequestDto({this.email, this.newPassword});


  factory ResetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestDtoToJson(this);
}
