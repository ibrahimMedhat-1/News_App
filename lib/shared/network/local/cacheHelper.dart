import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPrefrences;
  static init() async{
    return  sharedPrefrences =await SharedPreferences.getInstance();
  }

  static Future<bool> setBool({required String key,required bool value}) async{
    return await sharedPrefrences!.setBool(key, value);
  }
  static bool? getBool({required String key}) {
    return  sharedPrefrences!.getBool(key);
  }
}