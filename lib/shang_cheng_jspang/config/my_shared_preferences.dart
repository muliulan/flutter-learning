import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static final String car_list_key = "car_list1";

  void addList(String key, List<String> list) async {
    var instance = await SharedPreferences.getInstance();
    instance.setStringList(key, list);
  }

  Future<List<String>> getList(String key) async {
    var instance = await SharedPreferences.getInstance();
    var stringList = instance.getStringList(key);
    return stringList == null ? [] : stringList;
  }

  void del(String key) async {
    var instance = await SharedPreferences.getInstance();
    instance.remove(key);
  }
}
