import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/shang_cheng_jspang/pages/aaa_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/bbb_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/ccc_page.dart';
import 'package:untitled/shang_cheng_jspang/pages/ddd_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> list = [
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "首页"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "分类"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "ccc"),
    new BottomNavigationBarItem(icon: new Icon(CupertinoIcons.airplane), label: "ddd"),
  ];
  List<Widget> wlist = [
    aaa_page(),
    bbb_page(),
    ccc_page(),
    ddd_page(),
  ];

  var myindex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = wlist[myindex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: list,
          currentIndex: myindex,
          onTap: (index) {
            setState(() {
              myindex = index;
              currentPage = wlist[myindex];
            });
          },
        ),
        //页面数据保存 3
        body: new IndexedStack(
          index: myindex,
          children: wlist,
        ));
  }
}
