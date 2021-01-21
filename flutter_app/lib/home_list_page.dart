import 'package:flutter/material.dart';
import 'package:flutter_app/home_items.dart';
import 'package:flutter_app/home_pushOne.dart';
import 'package:flutter_app/home_pushTwo.dart';
import 'package:flutter_app/home_pushCounter.dart';
import 'package:flutter_app/home_dIyList.dart';
import 'package:flutter_app/Text_Button.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListPage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // Screenutil

    return Scaffold(
      appBar: new AppBar(
        title: new Text("标题"),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return Divider();
          // return new Container(
          //   height: 40.0,
          //   child: new Center(
          //     child: new Text("类型2"),
          //   ),
          //   color: Colors.blue,
          // );
        },
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(listItems[index]),
            onTap: () {
              _itemClicked(context, index);
            },
          );
        },
      ),
    );
  }

  void _itemClicked(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushNamed(HomePushOne.routeName);
    } else if (index == 1) {
      Navigator.of(context).pushNamed(HomePushTwo.routeName);
    } else if (index == 2) {
      Navigator.of(context).pushNamed(HomePushCounter.routeName);
    } else if (index == 3) {
      Navigator.of(context).pushNamed(HomeDIYList.routeName);
    } else if (index == 4) {
      Navigator.of(context).pushNamed(Text_Button.routeName);
    }
  }
}
