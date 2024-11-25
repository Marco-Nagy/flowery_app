import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  final String? email;

  ForgetPasswordRequestDto({this.email});

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);
}
