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
    );
  }
}

class TextFieldAndFormDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)),
          obscureText: true,
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
