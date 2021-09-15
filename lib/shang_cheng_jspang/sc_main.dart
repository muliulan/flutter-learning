import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/IndexPage.dart';
import 'package:untitled/shang_cheng_jspang/providers/bbb_providers.dart';
import 'package:untitled/shang_cheng_jspang/providers/cart_providers.dart';
import 'package:untitled/shang_cheng_jspang/providers/homeIndexProviders.dart';
import 'package:untitled/shang_cheng_jspang/routers/application.dart';
import 'package:untitled/shang_cheng_jspang/routers/my_routers.dart';

import 'providers/CounterProviders.dart';

void main() {
  //状态管理
  var providers = new Providers();
  providers
    ..provide(Provider<CounterProviders>.value(new CounterProviders()))
    ..provide(Provider<bbb_providers>.value(new bbb_providers()))
    ..provide(Provider<cart_providers>.value(new cart_providers()))
    ..provide(Provider<homeIndexProviders>.value(new homeIndexProviders()));
  var providerNode = ProviderNode(child: sc_main(), providers: providers);
  runApp(providerNode);
}

class sc_main extends StatelessWidget {
  sc_main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //初始化路由
    var fluroRouter = FluroRouter();
    MyRouters.config(fluroRouter);
    Application.fluroRouter = fluroRouter;

    return new ScreenUtilInit(
        designSize: Size(411, 820), //屏幕适配输入dp
        builder: () {
          return MaterialApp(
            onGenerateRoute: Application.fluroRouter.generator,
            debugShowCheckedModeBanner: false, //取消右上角 debug
            theme: new ThemeData(primaryColor: Colors.pink), //导航栏样式
            home: new Scaffold(
              appBar: new AppBar(
                title: new Text("商城"),
              ),
              body: IndexPage(),
            ),
          );
        });
  }
}

/***
    应用ID	5uWs2bI4YhnsPNMfUib5
    应用私钥	BYFn3QGxjSlv59g6ZmnWZUPtNkY4VEN8重置
    应用首页	jspang_商城_flutter
    回调地址	muliulan.com
 **/

/**
    https://dog.ceo/api/breed/hound/list
    {"message":["afghan","basset","blood","english","ibizan","plott","walker"],"status":"success"}

    https://dog.ceo/api/breed/hound/afghan/images/random
    https://dog.ceo/api/breed/hound/afghan/images/random/3
    {"message":"https:\/\/images.dog.ceo\/breeds\/hound-afghan\/n02088094_3793.jpg","status":"success"}
 * */
