import 'package:flutter/material.dart';
import 'package:flutter_app/home_list_page.dart';
import 'package:flutter_app/home_pushOne.dart';
import 'package:flutter_app/home_pushTwo.dart';
import 'package:flutter_app/home_pushCounter.dart';
import 'package:flutter_app/home_dIyList.dart';
import 'package:flutter_app/Text_Button.dart';
import 'package:flutter_app/ImgView.dart';
import 'package:flutter_app/Photo_viewDemo/home_screen.dart';
import 'package:flutter_app/SwitchAndCheckbox.dart';
import 'package:flutter_app/TextFieldAndForm.dart';

// /Users/fangsu/Desktop/FlutterDemo/flutter_app/lib/Photo_viewDemo/home_screen.dart

class HomeRouter {
  static final Map<String, WidgetBuilder> routes = {
    HomeListPage.routeName: (ctx) => HomeListPage(),
    HomePushOne.routeName: (ctx) => HomePushOne(),
    HomePushTwo.routeName: (ctx) => HomePushTwo(),
    HomePushCounter.routeName: (ctx) => HomePushCounter(),
    HomeDIYList.routeName: (ctx) => HomeDIYList(),
    Text_Button.routeName: (ctx) => Text_Button(),
    ImgView.routeName: (ctx) => ImgView(),
    HomeScreen.routeName: (ctx) => HomeScreen(),
    SwitchAndCheckbox.routeName: (ctx) => SwitchAndCheckbox(),
    TextFieldAndForm.routeName: (ctx) => TextFieldAndForm(),
  };
  static final String initialRoute = HomeListPage.routeName;
}
