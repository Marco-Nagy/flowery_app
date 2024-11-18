import '../../../domain/entities/request/login_request_entity.dart';

sealed class LoginScreenAction {}

class LoginAction extends LoginScreenAction {
  final LoginRequestEntity request;
  bool isRememberMe;

  LoginAction(this.request, this.isRememberMe);
}
