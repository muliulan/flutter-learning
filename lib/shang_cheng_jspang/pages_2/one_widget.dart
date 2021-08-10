import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';

class one_widget extends StatelessWidget {
  var image_url;
    one_widget({Key key,this.image_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_getImage(context), _getName(), _getmoney(), _one(context), _shuoMing(),_one(context)],
    );
  }

  Widget _getImage(BuildContext context) {
    return new Image.network(
      image_url,
      width: MediaQuery.of(context).size.width,
      height: 300,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _getName() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: new Text(
        "名字",
        style: new TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _getmoney() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5),
      child: new Row(
        children: [
          new Text(
            "¥22.00",
            style: new TextStyle(color: Colors.red, fontSize: 20),
          ),
          new Text("       市场价:    "),
          new Text(
            "¥22.00",
            style: new TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black38),
          )
        ],
      ),
    );
  }

  Widget _one(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: 10,
      color: Colors.black12,
    );
  }

  Widget _shuoMing() {
    return new Container(
      margin: EdgeInsets.only(top: 5,bottom: 5,left: 10),
      child: new Text("产品说明:11111111111111111111",style: new TextStyle(color: Colors.red,fontSize: 18),),
    );
  }
}
