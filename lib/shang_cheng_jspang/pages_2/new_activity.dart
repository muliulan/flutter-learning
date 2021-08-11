import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/entity/list_entity.dart';
import 'package:untitled/shang_cheng_jspang/pages_2/one_widget.dart';
import 'package:untitled/shang_cheng_jspang/pages_2/two_web.dart';
import 'package:untitled/shang_cheng_jspang/providers/cart_providers.dart';

import 'my_tools_bar.dart';

class new_activity extends StatelessWidget {
  var text;

  new_activity({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("传递过来的数据    ${text}");
    return MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: new Text("商品详情"),
          ),
          body: new Stack(
            children: [
              new Container(
                child: new ListView(
                  children: [
                    one_widget(
                      image_url: text,
                    ),
                    my_tools_bar(
                      myleft: true,
                      myright: false,
                    ),
                    two_web(),
                  ],
                ),
              ),
              new Positioned(bottom: 0, child: _getBottom(context))
            ],
          )),
    );
  }

  Container _getBottom(BuildContext context) {
    return new Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.yellow,
      child: new Row(
        children: [
          Container(
              width: 50,
              child: new Icon(
                Icons.ac_unit_sharp,
                color: Colors.red,
              )),
          Container(
              alignment: Alignment.center,
              height: 50,
              color: Colors.blue,
              width: (MediaQuery.of(context).size.width - 50) / 2,
              child: new Text(
                "立即购买",
                style: new TextStyle(color: Colors.white),
              )),
          InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: "加入成功",toastLength: Toast.LENGTH_SHORT);
              Provide.value<cart_providers>(context).save(text);
            },
            child: Container(
                alignment: Alignment.center,
                height: 50,
                color: Colors.green,
                width: (MediaQuery.of(context).size.width - 50) / 2,
                child: new Text("加入购物车", style: new TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }

// FutureBuilder<ListEntity> futureBuilder() {
//   return new FutureBuilder<ListEntity>(
//       future: getDetailsDeta(text),
//       builder: (context, data) {
//         if (data.hasData) {
//           return new Container(
//             child: new SingleChildScrollView(
//               child: new Column(
//                 children: data.data.message.map((e) => new Image.network(e)).toList(),
//               ),
//             ),
//           );
//         } else {
//           return new Text("加载中");
//         }
//       });
// }
}
