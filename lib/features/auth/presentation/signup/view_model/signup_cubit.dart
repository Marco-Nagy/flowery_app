import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/signup_response_dto.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/response/signup_response_entity.dart';
import 'package:flowery_e_commerce/features/auth/presentation/signup/view_model/signup_action.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../../domain/entities/request/signup_request_entity.dart';
import '../../../domain/use_cases/auth_use_case.dart';

part 'signup_state.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authUseCase) : super(SignupInitial());
  final AuthUseCase _authUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  String selectedGender = '';

  void doAction(SignupAction action) {
    switch (action) {

      case GenderSelected():
       {
         _selectGender(action.gender);
         break;
       }
      case SignupActionSelected():
        _signUpButtonPressed();
        break;
    }

  }

  void _selectGender(String gender) {
    selectedGender = gender;
    emit(SignupGenderSelected(selectedGender));
  }

  void _signUp(SignUpRequestEntity request) async {
    emit(SignupLoading());
    var result = await _authUseCase.signUp(request);

    switch (result) {
      case Success<SignUpResponseEntity>():
        emit(SignupSuccess(result.data));
        break;
      case Fail<SignUpResponseEntity>():
        final exception = result.exception;
        emit(SignupError( exception: exception));

        break;
    }
  }



  void _signUpButtonPressed() {
    if (signUpFormKey.currentState!.validate()) {
      _signUp(SignUpRequestEntity(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        rePassword: confirmPasswordController.text.trim(),
        phone: phoneNumberController.text.trim(),
        gender: selectedGender,
      ));
    }
  }

}
