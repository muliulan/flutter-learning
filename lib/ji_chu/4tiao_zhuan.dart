import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

void main() => runApp(MyApp4());

class MyApp4 extends StatelessWidget {
  const MyApp4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("列表"),
        ),
        body: new Cdddd(
          list: List.generate(20, (index) => Product("aa$index", "bb$index")),
        ),
      ),
    );
  }
}

class Cdddd extends StatelessWidget {
  List<Product> list;

  Cdddd({Key  key,    this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (cont, index) {
        return new Card(
          child: new ListTile(
            leading: new Text(list[index].aa),
            onTap: () {
              _navigate(context);
            },
          ),
        );
      },
      itemCount: list.length,
    );
  }

  //传递参数跳转
  void ddd(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => New(
                  text: list[index].aa,
                )));
  }

  //返回参数跳转
  _navigate(BuildContext context) async {
    var push = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => New(
                  text: "22222222",
                )));
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$push")));
  }
}

class New extends StatelessWidget {
  String text;

  New({Key  key,   this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("新页面")),
      body: Center(
          child: new RaisedButton(
        onPressed: () {
          Navigator.pop(context, "返回的数据");
        },
        child: new Text(text),
      )),
    );
  }
}

class Product {
  final String aa;
  final String bb;

  Product(this.aa, this.bb);
}
