import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast({
    required String message,
    required Color backgroundColor,
    required ToastGravity gravity,
    required dynamic icon,
  }) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static String iconToText(IconData icon) {
    return String.fromCharCode(icon.codePoint);
  }

  static void showLoadingToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: MyColors.primary,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.hourglass_bottom,
    );
  }

  static void showErrorToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: Colors.redAccent,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.error_outline,
    );
  }

  static void showSuccessToast({required String message}) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
      gravity: ToastGravity.BOTTOM,
      icon: Icons.check_circle,
    );
  }
}

