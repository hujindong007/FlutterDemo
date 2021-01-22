import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_app/Totast.dart';

class Text_Button extends StatelessWidget {
  static const String routeName = "/text_Button";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text_Button"),
      ),
      body: TextAndButtonDemo(),
    );
  }
}

class TextAndButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Toast.toast(
                    context,
                    msg: '提示一下', // String 提示的文本
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
        SizedBox(
          height: 5,
        ),
        RaisedButton(
          //悬浮按钮
          child: Text(
            "RaisedButton按钮",
            style: TextStyle(color: Colors.red),
          ),
          // textTheme: ButtonTextTheme.accent,
          elevation: 5, //设置阴影
          onPressed: () {
            print("点击onPressed");
          },
        ),
        SizedBox(
          height: 5,
        ),
        FlatButton(
          //扁平按钮
          child: Text(
            "FlatButton按钮",
            style: TextStyle(color: Colors.yellow),
          ),
          color: Colors.red,
          highlightColor: Colors.blue,
          shape: RoundedRectangleBorder(
            //圆角
            borderRadius: BorderRadius.circular(8),
          ),
// none：不裁剪
// hardEdge：裁剪但不应用抗锯齿，裁剪速度比none模式慢一点，但比其他方式快。
// antiAlias：裁剪而且抗锯齿，以实现更平滑的外观。裁剪速度比antiAliasWithSaveLayer快，比hardEdge慢。
// antiAliasWithSaveLayer：带有抗锯齿的剪辑，并在剪辑之后立即保存saveLayer。
          // clipBehavior: Clip.none,

          onPressed: () {
            print("点击FlatButton");
          },
        ),
        SizedBox(
          height: 5,
        ),
        OutlineButton(
          //有边框的
          child: Text(
            "OutlineButton按钮",
            style: TextStyle(color: Colors.orange, fontSize: 12),
          ),
          onPressed: () {
            print("点击OutlineButton");
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          disabledTextColor: Colors.yellow,
          textColor: Colors.red,
          disabledBorderColor: Colors.orange,
          focusColor: Colors.blue,
        ),
        SizedBox(
          height: 5,
        ),
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            print("点击IconButton");
          },
        ),
        // ButtonTheme(
        //   minWidth: 45,
        //   height: 45,
        //   child: Text("ButtonTheme按钮"),
        //   padding: EdgeInsets.all(2),
        //   buttonColor: Colors.red,
        // )
        SizedBox(
          height: 5,
        ),
        //自定义button
        Container(
            height: 50,
            width: 100,
            child: new FlatButton(
              onPressed: () => print("点击自定义FlatButton"),
              color: Colors.blue,
              // highlightColor: Colors.transparent,//高亮色
              focusColor: Colors.yellow, //获取焦点颜色
              splashColor: Colors.orange, //按压波浪色
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "心跳",
                    style: TextStyle(
                        backgroundColor: Colors.yellow, color: Colors.red),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

// const InkWell({
//     Key key,
//     Widget child, //子组件
//     GestureTapCallback onTap, //单击事件
//     GestureTapCallback onDoubleTap, //双击事件
//     GestureLongPressCallback onLongPress, //长按事件
//     GestureTapDownCallback onTapDown, //手指按下
//     GestureTapCancelCallback onTapCancel, //取消点击事件
//     ValueChanged<bool> onHighlightChanged, //突出显示或停止突出显示时调用
//     ValueChanged<bool> onHover, //当指针进入或退出墨水响应区域时调用
//     MouseCursor mouseCursor,
//     Color focusColor, //获取焦点颜色
//     Color hoverColor, //指针悬停时颜色
//     Color highlightColor, //按住不放时的颜色
//     MaterialStateProperty<Color> overlayColor,
//     Color splashColor, //溅墨颜色
//     InteractiveInkFeatureFactory splashFactory, //自定义溅墨效果
//     double radius, //溅墨半径
//     BorderRadius borderRadius, //溅墨元素边框圆角半径
//     ShapeBorder customBorder, //覆盖borderRadius的自定义剪辑边框
//     bool enableFeedback = true, //检测到的手势是否应该提供声音和/或触觉反馈，默认true
//     bool excludeFromSemantics = false, //是否将此小部件引入的手势从语义树中排除。默认false
//     FocusNode focusNode,
//     bool canRequestFocus = true,
//     ValueChanged<bool> onFocusChange,
//     bool autofocus = false,
//   })
