import 'package:flowery_e_commerce/features/auth/login/domain/entities/request/login_request_entity.dart';
import 'package:flowery_e_commerce/features/auth/login/domain/entities/response/login_response_entity.dart';
import 'package:flowery_e_commerce/features/auth/login/data/models/request/login_request_dto.dart';
import '../models/response/login_response_dto.dart';

class AuthMapper{
  static LoginRequestDto toDto(LoginRequestEntity request){
    return LoginRequestDto(email: request.email, password: request.password);
  }

  static LoginResponseEntity toEntity(LoginResponseDto response){
    return LoginResponseEntity(message: response.message, token: response.token);
  }
}