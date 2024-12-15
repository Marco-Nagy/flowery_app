import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../models/language.dart';
import 'language_service.dart';

@Injectable()
class LanguageProvider with ChangeNotifier {
  Language _selectedLanguage = Language(code: 'en');
  final LanguageService _languageService;

  LanguageProvider(this._languageService);

  Language get selectedLanguage => _selectedLanguage;

  Future<void> loadSelectedLanguage() async {
    final languageCode = await _languageService.getSelectedLanguage();
    if (languageCode != null) {
      _selectedLanguage = Language(code: languageCode);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(Language language) async {
    _selectedLanguage = language;
    await _languageService.saveSelectedLanguage(language.code);
    notifyListeners();
  }
}
