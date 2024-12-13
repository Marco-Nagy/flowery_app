import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationHelper {
  static late AppLocalizations _localizations;

  static void initialize(BuildContext context) {
    _localizations = AppLocalizations.of(context)!;
  }

  static AppLocalizations get localizations => _localizations;
}
