import 'package:flutter/material.dart';
import 'package:flutter_app/TestNewRoute.dart';

class HomePushCounter extends StatefulWidget {
  static const String routeName = "/pushCounter";
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePushCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("自增加一==$_counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("pushCounter"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              // style: Theme.of(context).textTheme.headline4,
              style: TextStyle(
                color: _counter == 1 ? Colors.red : Colors.yellow,
              ),
            ),
            FlatButton(
              child: Text("Open new route"),
              textColor: Colors.red,
              onPressed: () {
                //下面两个方法一样
                // example 1
                return Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return NewRoute(
                    text: "我是push值",
                  );
                }));
                // example 2
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text("异步返回"),
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return NewRoute(
                    text: "我是异步push值",
                    backgroundColor: Colors.yellow,
                  );
                }));
                print("pop返回值:$result");
              },
            )
          ],
        ),
      ),
      //浮动按钮
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: new Icon(Icons.add),
      // ),
      //浮动按钮 extended样式（文字和图片，label必须要写的）
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text("新增"),
      //   icon: Icon(Icons.add),
      //   tooltip: "Alert", //FAB的文字解释，FAB被长按时显示，也是无障碍功能
      // ),

// builder: (BuildContext context) 模式下scaffold.of 不会报错
      floatingActionButton: new Builder(
        builder: (BuildContext context) {
          return new FloatingActionButton(
            child: const Icon(Icons.add),
            mini: true,
            onPressed: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("FAB is Clicked"),
              ));
            },
          );
        },
      ),
      // 按钮位置
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
