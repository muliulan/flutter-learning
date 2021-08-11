import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/providers/cart_providers.dart';

class ccc_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<cart_providers>(
        builder: (context, child, val) {
          if (val.list_cart.length == 0) {
            return new FutureBuilder<List<String>>(
                future: cart_providers().myGet(),
                builder: (context, val) {
                  if (val.hasData) {
                    return getList(val.data,context);
                  } else {
                    return new Text("1111");
                  }
                });
          }

          return new Container(child: getList(val.list_cart,context));
        },
      ),
    );
  }

  Widget getList(List<String> val,BuildContext context) {
    return new Stack(
      children: [
        new Container(
          margin: EdgeInsets.only(bottom: 70),
          child: new ListView(
            children: val.map((e) => getView(e)).toList(),
          ),
        ),
        new Positioned(
          child: getBottom(context),
          bottom: 0,
        ),
      ],
    );
  }

  Widget getView(String url) {
    return new Container(
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      padding: EdgeInsets.only(left: 10, bottom: 5, right: 5),
      decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.black26, width: 2))),
      child: new Row(
        children: [
          Checkbox(
            value: false,
            activeColor: Colors.red,
            onChanged: (bool val) {},
          ),
          Image.network(
            url,
            height: 50,
            width: 50,
            fit: BoxFit.fitWidth,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            width: 230,
            child: Text(
              "名字: ${url.substring(url.length - 8, url.length - 4)}",
              style: new TextStyle(fontSize: 18),
            ),
          ),
          Column(
            children: [
              Text(
                "¥222",
                style: new TextStyle(fontSize: 20),
              ),
              Text(
                "¥222",
                style: new TextStyle(fontSize: 18, color: Colors.black26, decoration: TextDecoration.lineThrough),
              ),
              InkWell(
                onTap: () {
                  print("1111111111");
                  cart_providers().delItem(url);
                },
                child: Icon(Icons.delete_forever, color: Colors.black26),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getBottom(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: new Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (val) {},
            activeColor: Colors.red,
          ),
          Text("全选"),
          Container(
            width: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("需要支付的价格: "),
                    Text(
                      "¥222",
                      style: new TextStyle(color: Colors.red),
                    )
                  ],
                ),
                Text("看清支付价格")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 60,
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: new Text(
                  "确定",
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
