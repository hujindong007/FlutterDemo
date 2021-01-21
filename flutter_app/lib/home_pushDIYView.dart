import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Totast.dart';

class PushDIYView extends StatelessWidget {
  PushDIYView({
    Key key,
    @required this.text,
    this.backgroundColor,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: PushDIYDetailViewDemo(),
    );
  }
}

class PushDIYDetailViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: [
          SizedBox(
            height: 8,
            width: 12,
          ),
          Text(
            "第一个控件",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              backgroundColor: Colors.yellow,
              //underline 下划线 lineThrough 中 overline 顶
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          SizedBox(height: 2),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home: ", style: TextStyle(height: 2)),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(
                  color: Colors.blue,
                  // height: 1.2,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer() // 属性指定手势交互
                  ..onTap = () {
                    // print("Hello World7");
                    // showDialog<Null>(
                    //   context: context,
                    //   barrierDismissible: false,
                    //   builder: (BuildContext context) {
                    //     return new AlertDialog(
                    //       title: new Text('标题'),
                    //       content: new SingleChildScrollView(
                    //         child: new ListBody(
                    //           children: <Widget>[
                    //             new Text('内容 1'),
                    //             new Text('内容 2'),
                    //           ],
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         new FlatButton(
                    //           child: new Text('确定'),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ).then((val) {
                    //   print(val);
                    // });

                    // showCupertinoDialog(context);

                    Toast.toast(
                      context,
                      msg: '大哥~你不是点到了我吗~', // String 提示的文本
                      showTime: 2000, // int 显示的时间，单位milliseconds，也就是毫秒
                      bgColor: Color.fromRGBO(130, 0, 0, 1), // Color 提示框背景颜色
                      textColor:
                          Color.fromRGBO(250, 100, 100, 1), // Color 提示框文字颜色
                      textSize: 18.0, // double 提示框文字大小
                      position:
                          'bottom', // String 提示框显示位置，默认是center，可设置top和bottom
                      pdHorizontal: 50.0, // double 左右边距
                      pdVertical: 30.0, // double 上下边距
                    );
                  }),
          ])),
        ],
      ),
    );
  }

//   void showCupertinoDialog(BuildContext context) {
//     var dialog = CupertinoAlertDialog(
//       content: Text(
//         "你好,我是你苹果爸爸的界面",
//         style: TextStyle(fontSize: 20),
//       ),
//       actions: <Widget>[
//         // CupertinoButton(
//         //   child: Text("取消"),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//         // CupertinoButton(
//         //   child: Text("确定"),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//         CupertinoDialogAction(
//           child: Text('确定'),
//         ),
//         CupertinoDialogAction(
//           child: Text('取消'),
//         ),
//       ],
//     );

//     showDialog(context: context, builder: (_) => dialog);
//   }
// }

// class TapTextLink extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Container(),

//   }
}
