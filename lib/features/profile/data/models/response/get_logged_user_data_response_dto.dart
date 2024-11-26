import 'package:json_annotation/json_annotation.dart';

part 'get_logged_user_data_response_dto.g.dart';

@JsonSerializable()
class GetLoggedUserDataResponseDto {
  final String? message;
  final GetLoggedUserDataResponseDtoUser? user;

  GetLoggedUserDataResponseDto(this.message, this.user);

  factory GetLoggedUserDataResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetLoggedUserDataResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetLoggedUserDataResponseDtoToJson(this);
}

@JsonSerializable()
class GetLoggedUserDataResponseDtoUser {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? createdAt;

  GetLoggedUserDataResponseDtoUser(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo,
      this.role,
      this.createdAt);

  factory GetLoggedUserDataResponseDtoUser.fromJson(
          Map<String, dynamic> json) =>
      _$GetLoggedUserDataResponseDtoUserFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetLoggedUserDataResponseDtoUserToJson(this);
}
