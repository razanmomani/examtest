import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {
  //singleton
  static final SharedPreferencesHelper _shared =
  SharedPreferencesHelper._private();
  factory SharedPreferencesHelper() => _shared;
  SharedPreferencesHelper._private();
  Future<void> save({required String key, required dynamic value, required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          prefs.setBool(key, value);
        }
        break;
      case SaveType.stringType:
        {
          prefs.setString(key, value);
        }
        break;
      case SaveType.intType:
        {
          prefs.setInt(key, value);
        }
        break;
      case SaveType.stringListType:
        {
          prefs.setStringList(key, value);
        }
        break;
      case SaveType.doubleType:
        {
          prefs.setDouble(key, value);
        }
        break;
    }
  }
  Future<dynamic> read({required String key, required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          return prefs.getBool(key);
        }
      case SaveType.stringType:
        {
          return prefs.getString(key);
        }
      case SaveType.intType:
        {
          return prefs.getInt(key);
        }
      case SaveType.stringListType:
        {
          return prefs.getStringList(key);
        }
      case SaveType.doubleType:
        {
          return prefs.getDouble(key);
        }
    }
  }
}
enum SaveType {
  stringType,
  boolType,
  intType,
  doubleType,
  stringListType,
}
