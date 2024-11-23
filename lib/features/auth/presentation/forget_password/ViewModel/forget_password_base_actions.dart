import 'package:flowery_e_commerce/features/auth/domain/entities/request/forget_password_request_entity.dart';

import '../../../domain/entities/request/reset_password_request_entity.dart';
import '../../../domain/entities/request/verify_reset_code_request_entity.dart';

sealed class ForgetPasswordBaseActions {}

class ForgetPasswordAction implements ForgetPasswordBaseActions {
  ForgetPasswordRequestEntity body;

  ForgetPasswordAction(this.body);
}

class VerifyResetCodeAction implements ForgetPasswordBaseActions {
  VerifyResetCodeRequestEntity body;

  VerifyResetCodeAction(this.body);
}

class ResetPasswordAction implements ForgetPasswordBaseActions {
  ResetPasswordRequestEntity body;

  ResetPasswordAction(this.body);
}

class StartTimer implements ForgetPasswordBaseActions {}
