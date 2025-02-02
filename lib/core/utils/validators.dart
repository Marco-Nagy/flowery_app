import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import '../localization/lang_keys.dart';

class Validators {
  static String? validateNotEmpty({String? title, String? value , required BuildContext context}) {
    if (_isEmpty(value)) {
      return ("$title ${(context.translate(LangKeys.isRequired))}");
    }
    return null;
  }

  static String? validateEmail(String? value ,  BuildContext context) {
    if (_isEmpty(value)) {
      return ("${context.translate(LangKeys.emailIsRequired)}");
    }

    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(value!)) {
      return '${context.translate(LangKeys.invalidEmailAddress)}';
    }
    return null;
  }

  static String? validatePassword(String? value , BuildContext context) {
    if (_isEmpty(value)) {
      return '${context.translate(LangKeys.passwordIsRequired)}';
    }

    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$");

    if (!regex.hasMatch(value!)) {
      return '${context.translate(LangKeys.mustContains)} A-Z, a-z, @-#-&.. , 1-9';
    }

    return null;
  }

  static String? validatePasswordConfirmation(
      {String? password, String? confirmPassword , required BuildContext context}) {
    if (_isEmpty(password)) {
      return '${context.translate(LangKeys.passwordIsRequired)}';
    }
    if (_isEmpty(confirmPassword)) {
      return '${context.translate(LangKeys.confirmPasswordIsRequired)}';
    }

    if (password != confirmPassword) {
      return '${context.translate(LangKeys.passwordsDoNotMatch)}';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value , BuildContext context) {
    if (_isEmpty(value)) {
      return '${context.translate(LangKeys.phoneNumberIsRequired)}';
    }

    var regex = RegExp(
      r"^(?:\+20|0)?1[0125]\d{8}$",
    );

    if (!regex.hasMatch(value!)) {
      return "${context.translate(LangKeys.phoneNumberValidationHint)}";
    }

    return null;
  }

  static bool _isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
