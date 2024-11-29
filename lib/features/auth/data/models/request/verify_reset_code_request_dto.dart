import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request_dto.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  final String? resetCode;

  VerifyResetCodeRequestDto({this.resetCode});

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestDtoToJson(this);
  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetCodeRequestDtoFromJson(json);

}
