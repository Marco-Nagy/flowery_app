import 'package:flutter/cupertino.dart';
import '../../../domain/entities/request/login_request_entity.dart';

sealed class LoginScreenAction {}

class LoginAction extends LoginScreenAction {
  final LoginRequestEntity request;
  bool isRememberMe;
  BuildContext context;

  LoginAction(this.request, this.isRememberMe, this.context);
}
