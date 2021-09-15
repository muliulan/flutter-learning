import 'package:flutter/cupertino.dart';

class homeIndexProviders with ChangeNotifier{

  int index=0;

  void setIndex(int i){
    index=i;
    notifyListeners();
  }

}