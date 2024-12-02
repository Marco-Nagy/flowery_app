import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  final String? message;
  final String? token;

  ResetPasswordResponseDto({this.message, this.token});

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseDtoFromJson(json);


  Map<String, dynamic> toJson() => _$ResetPasswordResponseDtoToJson(this);
}
