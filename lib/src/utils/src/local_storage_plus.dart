import 'package:shared_preferences/shared_preferences.dart';

final localStoragePlus = LocalStoragePlus._instance;

class LocalStoragePlus {
  static final _instance = LocalStoragePlus._();
  LocalStoragePlus._();

  /// Save data with custom key
  Future write(String key, dynamic data) async {
    return SharedPreferences.getInstance().then((sharedPreferences) {
      if (data is bool) {
        sharedPreferences.setBool(key, data);
      } else if (data is String) {
        sharedPreferences.setString(key, data);
      } else if (data is int) {
        sharedPreferences.setInt(key, data);
      } else if (data is double) {
        sharedPreferences.setDouble(key, data);
      } else if (data is List<String>) {
        sharedPreferences.setStringList(key, data);
      } else {
        print('FlutterPlusUtils.write -> INVALID TYPE');
      }
    }).catchError((error) {
      print('FlutterPlusUtils.write -> $error');
    });
  }

  /// Get data with custom key
  Future<dynamic> read(String key) {
    return SharedPreferences.getInstance().then((sharedPreferences) {
      return sharedPreferences.get(key);
    }).catchError((error) {
      print('FlutterPlusUtils.read -> $error');
    });
  }

  /// Delete data with custom key
  Future<bool> delete(String key) async {
    return SharedPreferences.getInstance().then((sharedPreferences) {
      return sharedPreferences.remove(key);
    }).catchError((error) {
      print('FlutterPlusUtils.delete -> $error');
    });
  }

  /// Clear all local data
  Future<bool> clear() async {
    return SharedPreferences.getInstance().then((sharedPreferences) {
      return sharedPreferences.clear();
    }).catchError((error) {
      print('FlutterPlusUtils.clear -> $error');
    });
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    return SharedPreferences.getInstance().then((sharedPreferences) {
      return sharedPreferences.containsKey(key);
    }).catchError((error) {
      print('FlutterPlusUtils.containsKey -> $error');
    });
  }
}
