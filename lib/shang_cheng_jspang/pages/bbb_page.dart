import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/providers/bbb_providers.dart';

class bbb_page extends StatefulWidget {
  const bbb_page({Key key}) : super(key: key);

  @override
  _bbb_pageState createState() => _bbb_pageState();
}

class _bbb_pageState extends State<bbb_page> {
  List<String> l_list = [];
  List<String> r_list = [];
  var r_text = "";

  @override
  void initState() {
    getListDeta().then((value) {
      setState(() {
        l_list = value.message;
        r_text = l_list[0];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: new ListView.builder(
              itemCount: l_list.length,
              itemBuilder: (context, index) {
                return left(l_list[index]);
              }),
        ),
        Container(
          child: Provide<bbb_providers>(builder: (context, child, data) {
            r_network(data.text);
            return right(context);
          }),
        )
      ],
    );
  }

  Widget left(String s) {
    return new InkWell(
      onTap: () {
        Provide.value<bbb_providers>(context).setText(s);
      },
      child: new Container(
        alignment: Alignment.center,
        height: 150,
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(color: Colors.black12, width: 1),
                bottom: new BorderSide(color: Colors.black12, width: 1))),
        child: new Text(s),
      ),
    );
  }

  Widget right(BuildContext context) {
    return Container(
      width: 200,
      child: new ListView.builder(
        itemCount: r_list.length,
        itemBuilder: (context, index) {
          return Image.network(r_list[index]);
        },
      ),
    );
  }

  void r_network(String s) {
    var detailsDeta = getDetailsDeta(s);
    detailsDeta.then((value) {
      setState(() {
        r_list = value.message;
      });
    });
  }
}
