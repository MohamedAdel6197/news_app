import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }
}
