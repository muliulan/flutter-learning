import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp2(item: new List<String>.generate(10, (index) => "dddd $index")));

class Myapp2 extends StatelessWidget {
  List<String> item;

  Myapp2({Key  key,    this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text("listview"),
      ),
      body: getlistView3(context),
    ));
  }

  Widget getListview1() {
    return new ListView(
      children: [
        new ListTile(
          leading: new Icon(Icons.access_alarms),
          title: new Text("ddd"),
        ),
        new ListTile(
          leading: new Icon(Icons.access_alarms),
          title: new Text("ddd"),
        ),
        new ListTile(
          leading: new Icon(Icons.access_alarms),
          title: new Text("ddd"),
        ),
      ],
    );
  }

  //横向滑动
  Widget getlistView2() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal, //横向 纵向
      children: <Widget>[
        new Container(
          child: new Text("222"),
          width: 50,
        ),
        new Container(
          child: new Text("222"),
          width: 50,
        ),
        new Container(
          child: new Text("222"),
          width: 50,
        ),
      ],
    );
  }

  Widget getlistView3(BuildContext context) {
    return new ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        return new ListTile(
          title: new Text("${item[index]}"),
        );
      },
    );
  }
}
