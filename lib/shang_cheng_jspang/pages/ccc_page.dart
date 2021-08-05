import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/providers/CounterProviders.dart';

class ccc_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Column(
      children: [aa(context), bb(context)],
    ));
  }

  Widget aa(BuildContext context) {
    return new Provide<CounterProviders>(builder: (context, child, counter) {
      return new Text("${counter.num}");
    });
  }

  Widget bb(BuildContext context) {
    return new ElevatedButton(
        onPressed: () {
          Provide.value<CounterProviders>(context).add();
        },
        child: new Text("点击"));
  }
}
