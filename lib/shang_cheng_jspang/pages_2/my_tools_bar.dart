import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class my_tools_bar extends StatefulWidget {
  bool myleft = true;
  bool myright = false;

  my_tools_bar({Key key, this.myleft, this.myright}) : super(key: key);

  @override
  _my_tools_barState createState() => _my_tools_barState(myleft: myleft, myright: myright);
}

class _my_tools_barState extends State<my_tools_bar> {
  bool myleft = true;
  bool myright = false;

  _my_tools_barState({ this.myleft, this.myright});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _left(context, myleft),
        _right(context, myright),
      ],
    );
  }

  Widget _left(BuildContext context, bool isLsft) {
    print("22222222   ${isLsft}");

    return new InkWell(
      onTap: () {
        setState(() {
          myleft = true;
          myright = false;
        });
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 2,
        height: 50,
        decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(color: isLsft ? Colors.red : Colors.black26, width: 2))),
        // border: new Border(bottom: new BorderSide(color: isLsft ? Colors.red : Colors.black26, width: 1))),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              "左边",
              style: new TextStyle(
                color: isLsft ? Colors.red : Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _right(BuildContext context, bool isLsft) {
    print("22222222   ${isLsft}");
    return new InkWell(
      onTap: () {
        setState(() {
          myleft = false;
          myright = true;
        });
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 2,
        height: 50,
        decoration: new BoxDecoration(
            border: new Border(bottom: new BorderSide(color: isLsft ? Colors.red : Colors.black26, width: 2))),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              "右边",
              style: new TextStyle(
                color: isLsft ? Colors.red : Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
