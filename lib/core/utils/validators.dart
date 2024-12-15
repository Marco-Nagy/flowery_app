import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validators {
  static String? validateNotEmpty({String? title, String? value , required BuildContext context}) {
    if (_isEmpty(value)) {
      return ("$title ${AppLocalizations.of(context)!.is_required}");
    }
    return null;
  }

  static String? validateEmail(String? value ,  BuildContext context) {
    if (_isEmpty(value)) {
      return ("${AppLocalizations.of(context)!.email_is_required}");
    }

    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regex.hasMatch(value!)) {
      return '${AppLocalizations.of(context)!.invalid_email_address}';
    }
    return null;
  }

  static String? validatePassword(String? value , BuildContext context) {
    if (_isEmpty(value)) {
      return '${AppLocalizations.of(context)!.password_is_required}';
    }

    var regex = RegExp(
        r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z])(?=.*\d).*$");

    if (!regex.hasMatch(value!)) {
      return '${AppLocalizations.of(context)!.must_contains} A-Z, a-z, @-#-&.. , 1-9';
    }

    return null;
  }

  static String? validatePasswordConfirmation(
      {String? password, String? confirmPassword , required BuildContext context}) {
    if (_isEmpty(password)) {
      return '${AppLocalizations.of(context)!.password_is_required}';
    }
    if (_isEmpty(confirmPassword)) {
      return '${AppLocalizations.of(context)!.confirm_password_is_required}';
    }

    if (password != confirmPassword) {
      return '${AppLocalizations.of(context)!.passwords_do_not_match}';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value , BuildContext context) {
    if (_isEmpty(value)) {
      return '${AppLocalizations.of(context)!.phone_number_is_required}';
    }

    var regex = RegExp(
      r"^(?:\+20|0)?1[0125]\d{8}$",
    );

    if (!regex.hasMatch(value!)) {
      return "${AppLocalizations.of(context)!.phone_number_validation_hint}";
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
