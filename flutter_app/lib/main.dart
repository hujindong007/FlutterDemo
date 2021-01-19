// import 'dart:js_util';
import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import 'package:flutter/semantics.dart';
import 'package:flutter_app/home_routes.dart';

// void main() => runApp(new MyApp());

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyApp(),
  ));
}

// main(List<String> args) {
//   runApp(MyApp()); //应用入口
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Learn",
      theme: new ThemeData(
        primaryColor: Colors.red, //导航颜色
        // primarySwatch: Colors.yellow,
        splashColor: Colors.red, // 点击按钮时的渐变背景色，不设置高亮背景时才会看的更清楚
        highlightColor: Colors.transparent, //全局按压色
        backgroundColor: Colors.blue,
      ),
      initialRoute: HomeRouter.initialRoute,
      routes: HomeRouter.routes,
    );
  }
}
