import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    @required this.text, //接收一个text参数
    this.backgroundColor,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      // body: Center(
      //   child: Text("This is new route"),
      // ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
                color: backgroundColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
