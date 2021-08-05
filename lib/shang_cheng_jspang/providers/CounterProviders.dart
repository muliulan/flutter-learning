import 'package:flutter/cupertino.dart';

//状态管理
class CounterProviders with ChangeNotifier{
  var num=0;
  void add(){
    num++;//需要变化的值
    notifyListeners();//通知订阅者
  }
}