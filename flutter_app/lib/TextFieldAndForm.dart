import 'package:flutter/material.dart';

class TextFieldAndForm extends StatelessWidget {
  static const String routeName = "/textFieldAndForm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和表单"),
      ),
      body: TextFieldAndFormDemo(),
      // body: TextFieldAndFormFocusDemo(),
    );
  }
}

class TextFieldAndFormDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          //输入字体样式
          // style: TextStyle(backgroundColor: Colors.yellow, color: Colors.blue),
          autofocus: true, //自定获取光标
          obscureText: true, //密文显示
          // textInputAction: TextInputAction.search, //搜索按钮
          keyboardType: TextInputType.text,
          cursorColor: Colors.red, //光标颜色
          cursorWidth: 20, //光标宽度
          cursorRadius: Radius.circular(10), //光标圆角
          // enabled: false, //禁止输入
          // inputFormatters: [],
          onChanged: (change) {
            //监听文本变化
            print("输入内容:$change");
          },
          onSubmitted: (submit) {
            print("完成点击==$submit");
          },
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}

// textInputAction：键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值，全部的取值列表读者可以查看API文档，下面是当值为TextInputAction.search时

// style：正在编辑的文本样式。

// textAlign: 输入框内编辑文本在水平方向的对齐方式。

// autofocus: 是否自动获取焦点。

// obscureText：是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。

// maxLines：输入框的最大行数，默认为1；如果为null，则无行数限制。

// maxLength和maxLengthEnforced ：maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。

// onChange：输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。

// onEditingComplete和onSubmitted：这两个回调都是在输入框输入完成时触发，比如按了键盘的完成键（对号图标）或搜索键（🔍图标）。不同的是两个回调签名不同，onSubmitted回调是ValueChanged<String>类型，它接收当前输入内容做为参数，而onEditingComplete不接收参数。

// inputFormatters：用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。

// enable：如果为false，则输入框会被禁用，禁用状态不接收输入和事件，同时显示禁用态样式（在其decoration中定义）。

// cursorWidth、cursorRadius和cursorColor：这三个属性是用于自定义输入框光标宽度、圆角和颜色的。

// keyboardType：用于设置该输入框默认的键盘输入类型

// InputDecoration：用于控制TextField的外观显示，如提示文本、背景颜色、边框等。

class TextFieldAndFormFocusDemo extends StatefulWidget {
  @override
  _FocusRouteState createState() => new _FocusRouteState();
}

class _FocusRouteState extends State<TextFieldAndFormFocusDemo> {
  FocusNode focusnode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusnode1,
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: Text("隐藏焦点"),
                    onPressed: () {
                      focusnode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
