import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "dadwdwdw",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("开始"),
          ),
          body: ListView(
            children: [
              getText(),
              getContainer(),
              getImage(),
            ],
          )
          // new ListView(
          //   children: [getText(), getContainer(), getImage()],
          // ),
          ),
    );
  }

  Widget getText() {
    return new Text(
      "texttexttexttexttext",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left, //对其方式
      style: new TextStyle(
          fontSize: 20.0,
          color: Colors.red,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid),
    );
  }

  Widget getContainer() {
    return new Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.only(left: 20),
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.green]),
          border: Border.all(width: 5.0, color: Colors.deepOrange)),
      //边框线
      child: new Text(
        "ContainerContainer",
      ),
      // alignment: Alignment.center, //Container的对其方式
    );
  }

  Widget getImage() {
    var url = "https://img1.baidu.com/it/u=129630614,147776351&fm=26&fmt=auto&gp=0.jpg";
    return Container(
        width: 400,
        height: 100,
        color: Colors.blue,
        margin: EdgeInsets.only(top: 10),
        child: new Image.network(
          url,
          repeat: ImageRepeat.repeatX,
          fit: BoxFit.contain, //图片充满不变形
        ));
  }

  Widget getImage1() {
    return Container(
      width: 400,
      height: 100,
      child: new Image.asset('images/222.jpg'),
    );
  }
}
