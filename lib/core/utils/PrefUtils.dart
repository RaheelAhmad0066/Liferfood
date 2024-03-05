// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static String? userId;
  static String? userName;
  static String? imgUrl;
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance = await SharedPreferences.getInstance();

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String? getString(String key) {
    return PrefUtils._prefsInstance != null
        ? _prefsInstance!.getString(key)
        : null;
  }

  static Future<bool> setString(String key, String value) async {
    final prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    final prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool? getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    final prefs = await _instance;

    return prefs.setInt(key, value);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance!.getInt(key) ?? defValue ?? 0;
  }

  static Future<bool> setBugReportedTime(String key, int value) async {
    final prefs = await _instance;

    return prefs.setInt(key, value);
  }

  static Future clearPreferences() async {
    await _prefsInstance!.clear();
  }

  static Future<bool> setDouble(String key, double value) async {
    final prefs = await _instance;
    return prefs.setDouble(key, value);
  }

  static double getDouble(String key, [double? defValue]) {
    return _prefsInstance!.getDouble(key) ?? defValue ?? 0;
  }

  static Future<void> saveData({@required Map<String, dynamic>? data}) async {
    data?.forEach((key, value) async {
      switch (value.runtimeType) {
        case String:
          await PrefUtils.setString(key, value as String);
          return;
        case int:
          await PrefUtils.setInt(key, value as int);
          return;
        case bool:
          await PrefUtils.setBool(key, value as bool);
          return;
      }
    });
  }

  // static String getUserId() {
  //   userId = PrefUtils.getString(CacheKeys.USER_UID);
  //   return userId ?? '';
  // }
  //
  // static String getName() {
  //   userName = PrefUtils.getString(CacheKeys.USER_NAME);
  //   return userName ?? '';
  // }
  //
  // static String getImage() {
  //   imgUrl = PrefUtils.getString(CacheKeys.USER_PICTURE);
  //   return imgUrl ?? '';
  // }
  //
  // static Future<void> setImage(String name) async {
  //   PrefUtils.setString(CacheKeys.USER_PICTURE, name);
  // }

  static Future<bool> saveMap(String key, List<Map> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }

  static Future<List<Map<String, dynamic>>?> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    if (prefs.getString(key) == null) return null;
    return (jsonDecode(prefs.getString(key)!) as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }

  static Future<bool> removeValue(String key) async {
    final prefs = await _instance;
    return prefs.remove(key);
  }
}
