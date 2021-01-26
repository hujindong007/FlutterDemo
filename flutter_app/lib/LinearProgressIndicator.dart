import 'package:flutter/material.dart';

class ProgressIndicatorLearn extends StatelessWidget {
  static const String routeName = "/progressIndicatorLearn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      // body: ProgressIndicatorDemo(),
      body: AnmiationProgressIndicatorDemo(),
    );
  }
}

class ProgressIndicatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        //圆进度条
        CircularProgressIndicator(
          //指示器背景色
          backgroundColor: Colors.red,
          //指示器进度颜色
          valueColor: AlwaysStoppedAnimation(Colors.yellow),
          //当前进度
          value: 0.5,
          //宽
          strokeWidth: 10,
        ),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.blue,
          valueColor: AlwaysStoppedAnimation(Colors.orange),
        ),
        SizedBox(
          height: 10,
        ),
        //直线进度条
        LinearProgressIndicator(
          backgroundColor: Colors.yellow,
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
          child: LinearProgressIndicator(
            backgroundColor: Colors.red,
            value: .5,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 120,
          width: 120,
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlue,
            valueColor: AlwaysStoppedAnimation(Colors.red),
            // value: .5,
          ),
        ),
        RaisedButton(
          child: Text(
            "加载动画",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            print("点击加载动画");
            return AnmiationProgressIndicatorDemo();
          },
        )
      ],
    );
  }
}

class AnmiationProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

//进度条动画
class _ProgressRouteState extends State<AnmiationProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(seconds: 3)); //3秒
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.red,
              // 开始颜色绿色->黄色
              valueColor: ColorTween(begin: Colors.green, end: Colors.yellow)
                  .animate(_animationController),
              value: _animationController.value,
            ),
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.red,
            valueColor: ColorTween(begin: Colors.orange, end: Colors.yellow)
                .animate(_animationController),
            value: _animationController.value,
          ),
        ],
      ),
    );
  }
}
