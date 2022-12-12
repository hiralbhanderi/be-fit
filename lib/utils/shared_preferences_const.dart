import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesConst {
  static late SharedPreferences _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// for butt workout
  static Future<void> setChangeDayForButtWorkout(int isDayCount) async {
    await _prefs.setInt("isDayChangeForButtWorkout", isDayCount);
  }

  static int getsChangeDayForButtWorkout() {
    return _prefs.getInt("isDayChangeForButtWorkout") ?? 0;
  }

  /// for abs workout
  static Future<void> setChangeDayForAbsWorkout(int isDayCount) async {
    await _prefs.setInt("isDayChangeForAbsWorkout", isDayCount);
  }

  static int getsChangeDayForAbsWorkout() {
    return _prefs.getInt("isDayChangeForAbsWorkout") ?? 0;
  }

  /// for plan intermediate workout
  static Future<void> setChangeDayForPlanIntermediateWorkout(int isDayCount) async {
    await _prefs.setInt("isDayChangeForPlanIntermediateWorkout", isDayCount);
  }

  static int getsChangeDayForPlanIntermediateWorkout() {
    return _prefs.getInt("isDayChangeForPlanIntermediateWorkout") ?? 0;
  }

  /// for plan beginner workout
  static Future<void> setChangeDayForPlanBeginnerWorkout(int isDayCount) async {
    await _prefs.setInt("isDayChangeForPlanBeginnerWorkout", isDayCount);
  }

  static int getsChangeDayForPlanBeginnerWorkout() {
    return _prefs.getInt("isDayChangeForPlanBeginnerWorkout") ?? 0;
  }

  /// for plan advanced workout
  static Future<void> setChangeDayForPlanAdvancedWorkout(int isDayCount) async {
    await _prefs.setInt("isDayChangeForPlanAdvancedWorkout", isDayCount);
  }

  static int getsChangeDayForPlanAdvancedWorkout() {
    return _prefs.getInt("isDayChangeForPlanAdvancedWorkout") ?? 0;
  }

  /// for height and weight and target weight data store

  /// for height
  static Future<void> setHeightOfUser(String isHeightOfUser) async {
    await _prefs.setString("isHeightOfUser", isHeightOfUser);
  }

  static String getsHeightOfUser() {
    return _prefs.getString("isHeightOfUser") ?? '';
  }

  /// for weight
  static Future<void> setWeightOfUser(String isWeightOfUser) async {
    await _prefs.setString("isWeightOfUser", isWeightOfUser);
  }

  static String getsWeightOfUser() {
    return _prefs.getString("isWeightOfUser") ?? '';
  }

  /// for target weight
  static Future<void> setTargetWeightOfUser(String isTargetWeightOfUser) async {
    await _prefs.setString("isTargetWeightOfUser", isTargetWeightOfUser);
  }

  static String getsTargetWeightOfUser() {
    return _prefs.getString("isTargetWeightOfUser") ?? '';
  }

  /// for weight types change
  static Future<void> setChangeWeightTypesOfUser(bool isChangeWeightTypesOfUser) async {
    await _prefs.setBool("isChangeWeightTypesOfUser", isChangeWeightTypesOfUser);
  }

  static bool getsChangeWeightTypesOfUser() {
    return _prefs.getBool("isChangeWeightTypesOfUser") ?? false;
  }

  /// for water total
  static Future<void> setChangeWaterTotalOfUser(double isChangeWaterTotalOfUser) async {
    await _prefs.setDouble("isChangeWaterTotalOfUser", isChangeWaterTotalOfUser);
  }

  static double getsChangeWaterTotalOfUser() {
    return _prefs.getDouble("isChangeWaterTotalOfUser") ?? 2300.0;
  }

  /// for water drunk
  static Future<void> setChangeWaterDrunkOfUser(double isChangeWaterDrunkOfUser) async {
    await _prefs.setDouble("isChangeWaterDrunkOfUser", isChangeWaterDrunkOfUser);
  }

  static double getsChangeWaterDrunkOfUser() {
    return _prefs.getDouble("isChangeWaterDrunkOfUser") ?? 0.0;
  }

  /// for water goal screen for day change
  static Future<void> setChangeDate(String isChangeDate) async {
    await _prefs.setString("isChangeDate", isChangeDate);
  }

  static String getsChangeDate() {
    return _prefs.getString("isChangeDate") ?? '';
  }

  /// for achieve goal days
  static Future<void> setAchieveGoalDays(int isAchieveGoalDay) async {
    await _prefs.setInt("isAchieveGoalDay", isAchieveGoalDay);
  }

  static int getsAchieveGoalDay() {
    return _prefs.getInt("isAchieveGoalDay") ?? 0;
  }
}
