import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/entity/list_entity.dart';

class new_activity extends StatelessWidget {
  var text;

  new_activity({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("dddddddddddddd    ${text}");
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
          body: futureBuilder()),
    );
  }

  FutureBuilder<ListEntity> futureBuilder() {
    return new FutureBuilder<ListEntity>(
        future: getDetailsDeta(text),
        builder: (context, data) {
          if (data.hasData) {
            return new Container(
              child: new Column(
                children: data.data.message.map((e) => new Text(e)).toList(),
              ),
            );
          } else {
            return new Text("加载中");
          }
        });
  }
}
