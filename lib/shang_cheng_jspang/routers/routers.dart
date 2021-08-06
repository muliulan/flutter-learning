import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shang_cheng_jspang/routers/router_handler.dart';

import 'application.dart';

//路由的总管理类
class Routers {
  static var root = '/'; //根路径
  static var detail_page = "/detail";

  static void config(FluroRouter router) {
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      Fluttertoast.showToast(msg: "没有这个路由");
    });

    //新加的路由都要配置在这里 
    router.define(detail_page, handler: new_activity_handler);
  }

  //配置参数
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return Application.fluroRouter.navigateTo(context, path, transition:transition);
  }

}


