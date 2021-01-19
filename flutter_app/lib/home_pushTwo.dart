import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePushTwo extends StatelessWidget {
  static const String routeName = "/pushTwo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pushTwo"),
      ),
      // body: ListViewDemo(),
      body: refreshListViewDemo(),
    );
  }
}

// class ListViewDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
// // 默认构造函数构建的ListView
// // ListView.separated可以在生成的列表项之间添加一个分割组件
// // 它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器。

//     // return ListView(
//     //   shrinkWrap: true,
//     //   padding: const EdgeInsets.all(200.0),
//     //   children: <Widget>[
//     //     const Text('I\'m dedicating every day to you'),
//     //     const Text('Domestic life was never quite my style'),
//     //     const Text('When you smile, you knock me out, I fall apart'),
//     //     const Text('And I thought I was so smart'),
//     //   ],
//     // );
// // 例子1
//     // return ListView.builder(
//     //     itemCount: null, //列表项的数量，如果为null，则为无限列表。
//     //     itemExtent: 50.0, //cell 强制高度
//     //     itemBuilder: (BuildContext context, int index) {
//     //       print("index==$index");
//     //       return ListTile(title: Text("$index"));
//     //     });

//     //  例子2
//     Widget divider1 = Divider(
//       color: Colors.blue,
//     );
//     Widget divider2 = Divider(
//       color: Colors.red,
//     );
//     return ListView.separated(
//         itemCount: 100,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               title: Text("$index"),
//               onLongPress: () {
//                 print("长按$index行");
//               },
//               onTap: () {
//                 print("点击第$index行");
//               });
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return index % 2 == 0 ? divider1 : divider2;
//           // return new Container(
//           //   height: 40.0,
//           //   child: new Center(
//           //     child: new Text("类型2"),
//           //   ),
//           //   color: Colors.blue,
//           // ); //设置cell头
//         });
// // 设置固定标题头
//     // return Column(children: <Widget>[
//     //   ListTile(title: Text("商品列表")),
//     //   Expanded(
//     //     child: ListView.builder(itemBuilder: (BuildContext context, int index) {
//     //       return ListTile(title: Text("$index"));
//     //     }),
//     //   ),
//     // ]);
//   }
// }

class refreshListViewDemo extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<refreshListViewDemo> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(
          title: Text(index == 1
              ? "胜利大街历史记录福建省累死了时间到了介绍老家浪费时间离开教室里讲述了杰弗里斯四六级倒垃圾时了解到历史记录结束了"
              : _words[index]),
          onTap: () {
            print("点击第$index行");
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 1.0,
        color: Colors.red,
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //使用english_words包 每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
