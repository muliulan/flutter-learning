import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class two_web extends StatelessWidget {

  two_web({Key key}) : super(key: key);

  var html = """<div>
  <h1>详情信息</h1>
  <p>This is a fantastic product that you should buy!</p>
  <h3>Features</h3>
  <ul>
    <li>It actually works</li>
    <li>It exists</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
    <li>It doesn't cost much!</li>
  </ul>
  <!--You can pretty much put any html in here!-->
</div>""";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Html(data: html),
    );
  }
}
