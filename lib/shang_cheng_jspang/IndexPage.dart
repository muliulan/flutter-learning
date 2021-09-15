import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:untitled/shang_cheng_jspang/pages/aaa_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/bbb_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/ccc_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/ddd_page.dart';
import 'package:untitled/shang_cheng_jspang/providers/homeIndexProviders.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List<BottomNavigationBarItem> list = [
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "首页"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "分类"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "购物车"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "会员中心"),
  ];
  List<Widget> wlist = [
    aaa_page(),
    bbb_page(),
    ccc_page(),
    ddd_page(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Provide<homeIndexProviders>(builder: (context,child,val){
      return aa(val.index);
    });
  }

  Widget aa(int index) {
    return new Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: list,
          currentIndex: index,
          onTap: (index) {
            Provide.value<homeIndexProviders>(context).setIndex(index);
          },
        ),
        //页面数据保存 3
        body: new IndexedStack(
          index: index,
          children: wlist,
        ));
  }

  Widget dd() {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: new Text("data"),
      ),
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new IconButton(onPressed: () {}, icon: new Icon(Icons.ac_unit_sharp)),
            new SizedBox(),
            new IconButton(onPressed: () {}, icon: new Icon(Icons.ac_unit_sharp))
          ],
        ),
      ),
    );
  }
}
