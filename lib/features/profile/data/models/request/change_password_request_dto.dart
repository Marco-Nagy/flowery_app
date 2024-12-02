import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  final String? password;
  final String? newPassword;

  ChangePasswordRequestDto(this.password, this.newPassword);

  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);
}
