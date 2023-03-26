import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> initialize();

  // Read
  int? getInt(String key);

  bool? getBool(String key);

  bool hasKey(String key);

  double? getDouble(String key);

  String? getString(String key);

  Map<String, dynamic>? getJson(String key);

  /// The value should be encodable as JSON.
  Future<bool> setJson(String key, Object value);

  List<String>? getStringList(String key);

  // Write
  Future<bool> setInt(String key, int value);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  DateTime? getDate(String key) {
    final dateString = getString(key);
    return dateString == null ? null : DateTime.tryParse(dateString);
  }

  Future<bool> setDate(String key, DateTime date) => setString(key, date.toString());
}

class SharedPreferencesLocalStorageService extends LocalStorageService {
  late final SharedPreferences storage;

  @override
  Future<void> initialize() async {
    storage = await SharedPreferences.getInstance();
  }

  @override
  int? getInt(String key) => storage.getInt(key);

  @override
  bool? getBool(String key) => storage.getBool(key);

  @override
  double? getDouble(String key) => storage.getDouble(key);

  @override
  String? getString(String key) => storage.getString(key);

  @override
  List<String>? getStringList(String key) => storage.getStringList(key);

  @override
  DateTime? getDate(String key) {
    final val = storage.getInt(key);
    if (val == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(val);
  }

  Set<String> getKeys(String key) => storage.getKeys();

  @override
  Future<bool> setInt(String key, int value) => storage.setInt(key, value);

  @override
  Future<bool> setBool(String key, bool value) => storage.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) => storage.setDouble(key, value);

  @override
  Future<bool> setString(String key, String value) => storage.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) => storage.setStringList(key, value);

  @override
  Future<bool> setDate(String key, DateTime date) => storage.setInt(key, date.millisecondsSinceEpoch);

  @override
  Future<bool> remove(String key) => storage.remove(key);

  @override
  bool hasKey(String key) {
    return storage.containsKey(key);
  }

  @override
  Map<String, dynamic>? getJson(String key) {
    final jsonString = storage.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  @override
  Future<bool> setJson(String key, Object value) {
    final json = jsonEncode(value);
    return storage.setString(key, json);
  }
}
