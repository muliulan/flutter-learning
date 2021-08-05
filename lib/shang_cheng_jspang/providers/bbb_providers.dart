import 'package:flutter/cupertino.dart';

class bbb_providers with ChangeNotifier {
  var text = "默认";

  void setText(String s) {
    text = s;
    notifyListeners();
  }
}
