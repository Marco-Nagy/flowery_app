sealed class SignupAction {}

class GenderSelected extends SignupAction {
  final String gender;

  GenderSelected(this.gender);
}

class SignupActionSelected extends SignupAction {}
