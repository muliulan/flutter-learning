import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static final String car_list_key = "car_list";

  void addList(String key, List<String> list) async {
    var instance = await SharedPreferences.getInstance();
    instance.setStringList(key, list);
  }

  Future<List<String>> getList(String key) async {
    var instance = await SharedPreferences.getInstance();
    return instance.getStringList(key);
  }

  void del(String key) async {
    var instance = await SharedPreferences.getInstance();
    instance.remove(key);
  }
}
