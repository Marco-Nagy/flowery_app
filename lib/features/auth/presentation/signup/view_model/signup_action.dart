sealed class SignupAction {}

class GenderSelected extends SignupAction {
  final dynamic gender;

  GenderSelected(this.gender);
}

class SignupActionSelected extends SignupAction {}
