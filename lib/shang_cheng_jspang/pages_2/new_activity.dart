import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class new_activity extends StatelessWidget {
  var text;

  new_activity({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("新页面"),
        ),
        body: Container(
          child: new Text(text),
        ),
      ),
    );
  }
}
