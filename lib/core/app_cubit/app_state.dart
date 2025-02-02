
import 'dart:ui';

sealed class AppStates  {}
  class AppInitialState extends AppStates{}




  class    LanguageChangeState extends AppStates{
  final  Locale local;
  LanguageChangeState({required this.local});
  }


