// import 'dart:html';

import 'package:flutter/material.dart';

class RowAndColumnDemo extends StatelessWidget {
  static const String routeName = "/rowAndColumnDemo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      body: RowAndColumnViewDemo(),
    );
  }
}

class RowAndColumnViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello World"),
            Text("I am Jack"),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hello World"),
            Text("I am Jack"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // textDirection: TextDirection.ltr,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text("hello World"),
            Text("I am Jack"),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text(
              "hello World",
              style: TextStyle(fontSize: 30),
            ),
            Text("I am Jack"),
          ],
        ),
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.yellow,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(height: 20, color: Colors.red),
            ),
          ],
        ),
        Wrap(
          // 水平方向间距
          spacing: 10.0,
          //垂直方向间距
          runSpacing: 40.0,
          //沿主轴方向居中
          alignment: WrapAlignment.start,
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
              label: new Text("Hamilton"),
            ),
            new Chip(
              avatar: new CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("M"),
              ),
              label: Text("Lafayette"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("H"),
              ),
              label: Text("Mulligan"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("C"),
              ),
              label: Text("ABCCCC"),
            ),
          ],
        ),
        Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
          children: <Widget>[
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.orange,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.cyan,
            ),
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    // return super.getSize(constraints);
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
