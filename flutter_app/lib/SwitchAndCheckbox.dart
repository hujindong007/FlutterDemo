import 'package:flutter/material.dart';

class SwitchAndCheckbox extends StatelessWidget {
  static const String routeName = "/switchAndCheckbox";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: SwitchAndCheckboxDemo(),
    );
  }
}

class SwitchAndCheckboxDemo extends StatefulWidget {
  @override
  _SwitchAndCheckBoxRouteState createState() =>
      new _SwitchAndCheckBoxRouteState();
}

class _SwitchAndCheckBoxRouteState extends State<SwitchAndCheckboxDemo> {
  bool _switchSelected = true;
  bool _checkeBoxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      margin: EdgeInsets.fromLTRB(100, 120, 100, 20),
      child: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkeBoxSelected,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkeBoxSelected = value;
              });
            },
          ),
          Container(
            color: Colors.red,
            child: Row(
              children: <Widget>[
                Switch(
                  value: _switchSelected,
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkeBoxSelected,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      _checkeBoxSelected = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
