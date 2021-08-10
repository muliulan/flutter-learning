import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/entity/list_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class aaa_page extends StatefulWidget {
  const aaa_page({Key key}) : super(key: key);

  @override
  _aaa_pageState createState() => _aaa_pageState();
}

//页面数据保存 1  AutomaticKeepAliveClientMixin
class _aaa_pageState extends State<aaa_page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: new EasyRefresh(
          footer: new ClassicalFooter(
              bgColor: Colors.white,
              textColor: Colors.red,
              noMoreText: "你好",
              infoText: "加载中",
              loadReadyText: "上拉加载..."),
          onRefresh: () {},
          onLoad: () async {},
          child: ListView(
            children: [banner(), jinGang(), guang_gao(), launchUrl(), goods(), FloorTitle(), hot()],
          )),
    ));
  }

  //页面数据保存 2
  @override
  bool get wantKeepAlive => true;
}

class banner extends StatelessWidget {
  const banner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      //宽占满屏幕
      margin: EdgeInsets.all(10),
      color: Colors.red,
      child: new FutureBuilder(
          future: getDetailsDeta1(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var mhasData = (snapshot.data as ListEntity).message;
              return new Swiper(
                itemCount: mhasData.length,
                autoplay: true,
                itemBuilder: (context, index) {
                  print("${mhasData[index]}");
                  return new Image.network(
                    mhasData[index],
                    fit: BoxFit.cover,
                  );
                },
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

//金刚
class jinGang extends StatelessWidget {
  const jinGang({Key key}) : super(key: key);

  Widget getView(BuildContext context, url) {
    return new InkWell(
      onTap: () {},
      child: new Column(
        children: [
          Image.network(
            url,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          new Text("ssssss")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170,
        child: GridView.count(
          crossAxisCount: 5,
          physics: NeverScrollableScrollPhysics(), //嵌套禁止滚动
          children: getImageList().map((e) => getView(context, e)).toList(),
        ));
  }
}

//广告位
class guang_gao extends StatelessWidget {
  const guang_gao({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        InkWell(
          child: new Text("广告位"),
        ),
        Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: new Image.network(
              getImage(1),
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}

//拨打电话
class launchUrl extends StatelessWidget {
  const launchUrl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
          onPressed: () {
            _da();
          },
          child: Container(
              alignment: Alignment.center, width: MediaQuery.of(context).size.width, child: new Text("拨打电话"))),
    );
  }

  void _da() async {
    var url = "tel:" + "15011111111";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("不能拨打");
    }
  }
}

//商品推荐
class goods extends StatelessWidget {
  const goods({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 230,
          child: new ListView.builder(
              itemCount: getImageList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return item1(getImageList()[index]);
              }),
        )
      ],
    );
  }

  Widget title() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(border: new Border.all(color: Colors.red)),
      child: new Text("商品推荐"),
    );
  }

  Widget item1(String url) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(border: new Border.all(color: Colors.green)),
      child: Column(
        children: [
          Container(
              height: 200,
              width: 100,
              child: Image.network(
                url,
                fit: BoxFit.cover,
              )),
          new Text("商品名称")
        ],
      ),
    );
  }
}

//楼层组件
class FloorTitle extends StatelessWidget {
  const FloorTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _image(context, MediaQuery.of(context).size.width),
          Row(
            children: [left(context), right(context)],
          ),
          Row(
            children: [
              _image(context, MediaQuery.of(context).size.width / 2),
              _image(context, MediaQuery.of(context).size.width / 2)
            ],
          )
        ],
      ),
    );
  }

  Widget _image(BuildContext context, double witha) {
    double a = 0;
    if (witha == MediaQuery.of(context).size.width) {
      a = 10;
    }
    return new Container(
      width: witha,
      height: 100,
      margin: EdgeInsets.only(top: a),
      child: Image.network(
        getImage(4),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget left(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 150,
      child: Image.network(
        getImage(5),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget right(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Container(
              child: Image.network(getImage(1),
                  height: 75, width: MediaQuery.of(context).size.width / 2, fit: BoxFit.cover)),
          Image.network(getImage(2), height: 75, width: MediaQuery.of(context).size.width / 2, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

//火爆专区
class hot extends StatelessWidget {
  const hot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(border: new Border.all(color: Colors.red, width: 1)),
            child: new Text(
              "火爆专区",
              textAlign: TextAlign.center,
            )),
        grid(context)
      ],
    );
  }

  Widget grid(BuildContext context) {
    return Container(
        child: Wrap(
      children: getImageList().map((e) => item(e, context)).toList(),
    ));
  }

  Widget item(String url, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 7,
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    );
  }
}
