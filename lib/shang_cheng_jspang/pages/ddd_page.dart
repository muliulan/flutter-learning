import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ddd_page extends StatefulWidget {
  const ddd_page({Key key}) : super(key: key);

  @override
  _ddd_pageState createState() => _ddd_pageState();
}

class _ddd_pageState extends State<ddd_page> with SingleTickerProviderStateMixin {
  var _list = ["111", "222", "333"];
  var _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(controller: _tabController, tabs: _list.map((e) => new Tab(text: e)).toList()),
      ),
      body: TabBarView(children: _list.map((e) => new Text(e)).toList(),controller: _tabController,),
    );
  }
}
