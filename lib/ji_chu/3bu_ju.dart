import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

void main() => runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  const MyApp3({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("布局"),
        ),
        body: ListView(
          children: [
            getRow(),
            new Divider(),
            getColumu(),
            new Divider(),
            getStack(),
            new Divider(),
            getPositioned(),
            new Divider(),
            getCardWidget(),
            new Divider(),
            getCardWidget(),
          ],
        ),
      ),
    );
  }

  //横向布局
  Widget getRow() {
    return new Row(
      children: [
        //权重  填充满
        Expanded(
            child: RaisedButton(
          onPressed: () {},
          child: new Text("dddd"),
          color: Colors.red,
        )),
        Expanded(
            child: RaisedButton(
          onPressed: () {},
          child: new Text("dddd"),
          color: Colors.green,
        )),
        RaisedButton(
          onPressed: () {},
          child: new Text("dddd"),
          color: Colors.red,
        ),
      ],
    );
  }

  //纵向
  Widget getColumu() {
    return new Column(
      //Column的 纵向对其方式
      crossAxisAlignment: CrossAxisAlignment.start,
      //Column的 横向对其方式
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        new Text("111"),
        new Text("111"),
        new Text("111"),
        new Text("111"),
      ],
    );
  }

  //层叠布局(2个组件)
  Widget getStack() {
    var url = "https://img1.baidu.com/it/u=129630614,147776351&fm=26&fmt=auto&gp=0.jpg";
    return Stack(
      alignment: FractionalOffset(0.5, 0), //对其方式 0-1  0.5是中间
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 5), color: Colors.blue),
          child: new CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        new Text(
          "dawdawdawdawdawdw",
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  //层叠布局(多个组件)
  Widget getPositioned() {
    return new Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
        ),
        Positioned(
          top: 10,
          child: new Text("22"),
        ),
        Positioned(left: 20, child: new Text("33")),
      ],
    );
  }

  //卡片布局
  Widget getCardWidget() {
    return new Card(
      color: Colors.red,
      child: Container(
        padding: EdgeInsets.all(10),
        child: new ListTile(
          title: new Text("zzzzzzzzz"),
          leading: Icon(Icons.import_contacts_sharp),
          subtitle: new Text("zzzzzzzzz"),
        ),
      ),
    );
  }
}
