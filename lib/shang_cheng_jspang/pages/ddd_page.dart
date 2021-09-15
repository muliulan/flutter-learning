import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ddd_page extends StatefulWidget {
  const ddd_page({Key key}) : super(key: key);

  @override
  _ddd_pageState createState() => _ddd_pageState();
}

class _ddd_pageState extends State<ddd_page> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _aaa(),
        _bbb(),
        new Flex(
          direction: Axis.horizontal,
          children: [_ccc(), _ccc(), _ccc(), _ccc()],
        ),
        _bbb(),
        _bbb(),
      ],
    );
  }

  Widget _aaa() {
    return new Container(
      color: Colors.blue,
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: new Column(
        children: [
          new ClipOval(
              child: new Image.asset(
            "images/222.jpg",
            height: 150,
          )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: new Text(
                "muliulan",
                style: new TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _bbb() {
    return new Container(
      decoration: new BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: new ListTile(
        leading: Icon(Icons.ac_unit),
        title: new Text("我的订单"),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _ccc() {
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
          border: Border(
              bottom: new BorderSide(color: Colors.black12, width: 1),
              left: new BorderSide(color: Colors.black12, width: 1))),
      child: new Column(
        children: [Icon(Icons.invert_colors_on_sharp), Text("订单1")],
      ),
    ));
  }
}
