import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

aweSnackBar({
  required String msg,
  required BuildContext context,
  required String type,
  String? title,
}) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      messageTextStyle: MyFonts.styleBold700_18.copyWith(),
      title: title.toString(),
      message: msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: getMsgType(type, msg),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

bannerSnackBar(
    {required String msg,
    required String title,
    required BuildContext context,
    required String type}) {
  final materialBanner = MaterialBanner(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      title: title,
      message: msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: getMsgType(type, msg),
      // to configure for material banner
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showMaterialBanner(materialBanner);
}

ContentType getMsgType(String type, String msg) {
  switch (type) {
    case MessageTypeConst.failure:
      return ContentType(msg, Colors.redAccent);
    case MessageTypeConst.help:
      return ContentType.help;
    case MessageTypeConst.warning:
      return ContentType.warning;
    case MessageTypeConst.success:
      return ContentType(msg, Colors.lightGreen);
  }
  return ContentType(type);
}

class MessageTypeConst {
  static const String failure = 'failure';
  static const String help = 'help';
  static const String warning = 'warning';
  static const String success = 'success';
}
