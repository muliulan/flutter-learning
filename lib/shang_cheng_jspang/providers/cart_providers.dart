import 'package:flutter/cupertino.dart';
import 'package:untitled/shang_cheng_jspang/config/my_shared_preferences.dart';

class cart_providers with ChangeNotifier {
  List<String> list_cart = [];

  void save(String s) {
    get().then((value) {
      value.add(s);
      MySharedPreferences().addList(MySharedPreferences.car_list_key, value);
      list_cart = value;
      notifyListeners();
    });

    notifyListeners();
  }

  void del() {
    MySharedPreferences().del(MySharedPreferences.car_list_key);
    notifyListeners();
  }

  Future<List<String>> get() {
    return MySharedPreferences().getList(MySharedPreferences.car_list_key);
  }
}
