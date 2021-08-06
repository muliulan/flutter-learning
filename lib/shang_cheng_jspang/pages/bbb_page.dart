import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/providers/bbb_providers.dart';
import 'package:untitled/shang_cheng_jspang/routers/application.dart';
import 'package:untitled/shang_cheng_jspang/routers/routers.dart';

class bbb_page extends StatefulWidget {
  const bbb_page({Key key}) : super(key: key);

  @override
  _bbb_pageState createState() => _bbb_pageState();
}

class _bbb_pageState extends State<bbb_page> {
  List<String> l_list = [];
  var _click = 0;
  var _clickText = "";
  ValueNotifier<List<String>> _notifier = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    getListDeta().then((value) {
      setState(() {
        l_list = value.message;
        _clickText = l_list[0];
        Provide.value<bbb_providers>(context).setText(l_list[0]);
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
                return left(index);
              }),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Provide<bbb_providers>(builder: (context, child, data) {
            r_network(data.text);
            return right(context);
          }),
        )
      ],
    );
  }

  Widget left(int index) {
    return new InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: l_list[index], toastLength: Toast.LENGTH_SHORT);

        Provide.value<bbb_providers>(context).setText(l_list[index]);
        setState(() {
          _click = index;
          _clickText = l_list[index];
        });
      },
      child: new Container(
        alignment: Alignment.center,
        height: 150,
        decoration: new BoxDecoration(
            color: index == _click ? Colors.red : Colors.white,
            border: new Border(
                right: new BorderSide(color: Colors.black12, width: 1),
                bottom: new BorderSide(color: Colors.black12, width: 1))),
        child: new Text(l_list[index]),
      ),
    );
  }

  Widget right(BuildContext context) {
    return ValueListenableBuilder<List<String>>(
        valueListenable: _notifier,
        builder: (context, data, child) {
          if (data == null) return Container();
          return Expanded(
              child: Container(
            child: new ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return new InkWell(
                  onTap: () {

                    Routers.navigateTo(context, Routers.detail_page,params: {"id":data[index]});
                  },
                  child: Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Image.network(
                        data[index],
                        fit: BoxFit.fitWidth,
                      )),
                );
              },
            ),
          ));
        });
  }

  void r_network(String s) {
    var detailsDeta = getDetailsDeta(s);
    detailsDeta.then((value) {
      _notifier.value = value.message;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _notifier.dispose();
  }
}
