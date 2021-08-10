import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/providers/cart_providers.dart';

class ccc_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Provide<cart_providers>(
        builder: (context, child, val) {
          return new ListView(
            children: val.list_cart
                .map((e) => Container(
                    margin: EdgeInsets.all(5),
                    child: new Image.network(
                      e,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    )))
                .toList(),
          );
        },
      ),
    );
  }

// Widget aa(BuildContext context) {
//   return new Provide<CounterProviders>(builder: (context, child, counter) {
//     return new Text("${counter.num}");
//   });
// }
//
// Widget bb(BuildContext context) {
//   return new ElevatedButton(
//       onPressed: () {
//         Provide.value<CounterProviders>(context).add();
//       },
//       child: new Text("点击"));
// }
}
