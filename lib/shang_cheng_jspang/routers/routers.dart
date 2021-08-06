import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shang_cheng_jspang/routers/router_handler.dart';

//路由的总管理类
class Routers {
  static var root = '/'; //根路径
  static var detail_page = "/detail";

  static void config(FluroRouter router) {

    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      Fluttertoast.showToast(msg: "没有这个路由");
    });

    //新加的路由都要配置在这里 
    router.define(detail_page+"/:id", handler: new_activity_handler);
  }
}
