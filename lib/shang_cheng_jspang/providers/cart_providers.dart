import 'package:flutter/cupertino.dart';
import 'package:untitled/shang_cheng_jspang/config/my_shared_preferences.dart';

class cart_providers with ChangeNotifier {
  List<String> list_cart = [];

  void save(String s) {
    list_cart.add(s);
    MySharedPreferences().addList(MySharedPreferences.car_list_key, list_cart);
    notifyListeners();
  }

  void del() {
    MySharedPreferences().del(MySharedPreferences.car_list_key);
    notifyListeners();
  }
}
