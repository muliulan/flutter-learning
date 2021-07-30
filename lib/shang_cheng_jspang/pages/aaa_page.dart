import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:untitled/shang_cheng_jspang/config/http_url.dart';
import 'package:untitled/shang_cheng_jspang/entity/list_entity.dart';

class aaa_page extends StatefulWidget {
  const aaa_page({Key key}) : super(key: key);

  @override
  _aaa_pageState createState() => _aaa_pageState();
}

class _aaa_pageState extends State<aaa_page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          banner(),jinGang()
        ],
      ),
    ));
  }
}

class banner extends StatelessWidget {
  const banner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
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
                itemBuilder: (context, index) {
                  print("${mhasData[index]}");
                  return new Image.network(
                    mhasData[index],
                    fit: BoxFit.contain,
                  );
                },
              );
            } else {
              return new Text(
                "111111",
                style: new TextStyle(fontSize: 22.sp),
              );
            }
          }),
    );
  }
}

class jinGang extends StatelessWidget {
  const jinGang({Key key}) : super(key: key);

  Widget getView(BuildContext context, url) {
    return new InkWell(
      onTap: () {},
      child: new Column(
        children: [
          Image.network(
            url,
            width: 50,height: 50,
            fit:BoxFit.fill,
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
          children: getDetailsDeta2().map((e) => getView(context, e)).toList(),
        ));
  }
}




