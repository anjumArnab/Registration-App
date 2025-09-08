import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  // Keys for SharedPreferences
  static const String _userDataKey = "userData";
  static const String _isLoginKey = "isLogin";

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get SharedPreferences instance
  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception(
          'SharedPreferences not initialized. Call SharedPref.init() first.');
    }
    return _preferences!;
  }

  // Save user data
  static Future<bool> saveUserData(User user) async {
    try {
      String jsonString = jsonEncode(user.toJson());
      return await preferences.setString(_userDataKey, jsonString);
    } catch (e) {
      debugPrint('Error saving user data: $e');
      return false;
    }
  }

  // Get user data
  static User? getUserData() {
    try {
      String? userDataString = preferences.getString(_userDataKey);
      if (userDataString != null) {
        Map<String, dynamic> userData = jsonDecode(userDataString);
        return User.fromJson(userData);
      }
      return null;
    } catch (e) {
      debugPrint('Error getting user data: $e');
      return null;
    }
  }

  // Check if user data exists
  static bool hasUserData() {
    return preferences.containsKey(_userDataKey);
  }

  // Set login status
  static Future<bool> setLoginStatus(bool isLogin) async {
    try {
      return await preferences.setBool(_isLoginKey, isLogin);
    } catch (e) {
      debugPrint('Error setting login status: $e');
      return false;
    }
  }

  // Get login status
  static bool getLoginStatus() {
    try {
      return preferences.getBool(_isLoginKey) ?? false;
    } catch (e) {
      debugPrint('Error getting login status: $e');
      return false;
    }
  }

  // Clear all user data (for logout)
  static Future<bool> clearUserData() async {
    try {
      await preferences.remove(_userDataKey);
      await preferences.setBool(_isLoginKey, false);
      return true;
    } catch (e) {
      debugPrint('Error clearing user data: $e');
      return false;
    }
  }

  // Clear all preferences
  static Future<bool> clearAll() async {
    try {
      return await preferences.clear();
    } catch (e) {
      debugPrint('Error clearing all preferences: $e');
      return false;
    }
  }
}
