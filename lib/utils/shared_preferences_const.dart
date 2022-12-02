import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesConst{

  static late SharedPreferences _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setChangeDay(int isDayCount) async {
    // final SharedPreferences prefs = await prefsData;
    await _prefs.setInt("isDayChange", isDayCount);
  }

  static int getsChangeDay() {
    // final SharedPreferences prefs = await prefsData;
    return _prefs.getInt("isDayChange") ?? 0;

  }
}