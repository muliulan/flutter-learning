import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/shang_cheng_jspang/pages_2/new_activity.dart';

//new_activity 的路由
var new_activity_handler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var first2 = parameters["id"][0];
  return new_activity(
    text: first2,
  );
});
