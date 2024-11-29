import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  factory SharedPrefHelper() {
    return preferences;
  }

  SharedPrefHelper._internal();

  static final SharedPrefHelper preferences = SharedPrefHelper._internal();

  static late SharedPreferences sharedPreferences;

  ///Below method is to initialize the SharedPreference instance.
  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Below method is to return the SharedPreference instance.
  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future<dynamic> setString({
    required String key,
    required String stringValue,
  }) async {
    await sharedPreferences.setString(key, stringValue);
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future<dynamic> setBoolean({
    required String key,
    required bool boolValue,
  }) async {
    await sharedPreferences.setBool(key, boolValue);
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key);
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future<dynamic> setDouble({
    required String key,
    required double doubleValue,
  }) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  ///Below method is to set the double value from the SharedPreferences.
  double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future<dynamic> setInt({required String key, required int intValue}) async {
    await sharedPreferences.setInt(key, intValue);
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  ///Below method is to remove the received preference.
  Future<dynamic> removePreference({required String key}) async {
    await sharedPreferences.remove(key);
  }

  ///Below method is to check the availability of the received preference .
  bool containPreference({required String key}) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  ///Below method is to clear the SharedPreference.
  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
}
