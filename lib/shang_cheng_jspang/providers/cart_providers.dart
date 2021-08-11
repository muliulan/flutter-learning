import 'package:flutter/cupertino.dart';
import 'package:untitled/shang_cheng_jspang/config/my_shared_preferences.dart';

class cart_providers with ChangeNotifier {
  List<String> list_cart = [];

  void save(String s) {
    MySharedPreferences().getList(MySharedPreferences.car_list_key).then((value) {
      value.add(s);
      MySharedPreferences().addList(MySharedPreferences.car_list_key, value);
      list_cart = value;
      notifyListeners();
    });
  }

  void del() {
    MySharedPreferences().del(MySharedPreferences.car_list_key);
    notifyListeners();
  }

  void delItem(String url) {
    myGet().then((value) {
      value.remove(url);
      list_cart = value;
      notifyListeners();
    });
  }


   Future<List<String>> myGet() async{
    var list = await MySharedPreferences().getList(MySharedPreferences.car_list_key);
    list_cart=list;
    return list_cart;
  }
}
