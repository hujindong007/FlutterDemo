import 'package:flutter/material.dart';
import 'package:flutter_app/home_list_page.dart';
import 'package:flutter_app/home_pushOne.dart';
import 'package:flutter_app/home_pushTwo.dart';
import 'package:flutter_app/home_pushCounter.dart';
import 'package:flutter_app/home_dIyList.dart';

class HomeRouter {
  static final Map<String, WidgetBuilder> routes = {
    HomeListPage.routeName: (ctx) => HomeListPage(),
    HomePushOne.routeName: (ctx) => HomePushOne(),
    HomePushTwo.routeName: (ctx) => HomePushTwo(),
    HomePushCounter.routeName: (ctx) => HomePushCounter(),
    HomeDIYList.routeName: (ctx) => HomeDIYList(),
  };
  static final String initialRoute = HomeListPage.routeName;
}
