import 'package:flutter/cupertino.dart';

import '../../localization/app_localizations.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isLandScape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  String  translate(String text) {
    if (AppLocalizations.of(this) != null) {
      return AppLocalizations.of(this )!.translate(text)
          .toString();
    }else {
      return '';
    }
  }
}