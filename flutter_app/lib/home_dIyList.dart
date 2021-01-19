import 'package:flutter/material.dart';
import 'package:flutter_app/home_pushDIYView.dart';

class HomeDIYList extends StatelessWidget {
  static const String routeName = "/dIyList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: new AppBar(
        title: Text("练习二"),
      ),
      body: dIyListViewDemo(),
    );
  }
}

class dIyListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          print("开始滚动");
        } else if (notification is ScrollUpdateNotification) {
          print("正在滚动 ${notification.metrics.pixels}");
        } else if (notification is ScrollEndNotification) {
          print("结束滚动");
        }
        return true;
      },
      // return ListView(
      child: ListView(
        children: <Widget>[
          DIYListViewDemoCellItem("第一行标题第一行标题第一行标题第一行标题", "第一行副标题", "第一行内容",
              "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg",
              onTapClick: () async {
            var result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return PushDIYView(
                text: "我是异步push值",
                backgroundColor: Colors.yellow,
              );
            }));
            print("pop返回值:$result");
          }, onLongTap: () {
            print("长按第一行");
          }),
          DIYListViewDemoCellItem("第二行标题", "第二行副标题", "第二行内容",
              "https://upload-images.jianshu.io/upload_images/16117826-02bce852cd0d3ca9.jpg",
              onTapClick: () {
            print("点击第二行");
          }, onLongTap: () {
            print("长按第二行");
          }),
        ],
      ),
    );
  }
}

class DIYListViewDemoCellItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String content;
  final String imgUrl;
  final VoidCallback onTapClick;
  final VoidCallback onLongTap;

  // DIYListViewDemoCellItem(this.title, this.content, this.imgUrl,
  //     {this.onTapClick},{this.onLongTap});
  DIYListViewDemoCellItem(this.title, this.subTitle, this.content, this.imgUrl,
      {this.onLongTap, this.onTapClick});

  final stytleOne = TextStyle(color: Colors.red, fontSize: 18);
  final styleTwo = TextStyle(color: Colors.yellow, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    print('width is $width; height is $height');
    return Container(
      padding: EdgeInsets.all(12),
      //裁剪边框
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.black12, width: 1),
      //   // borderRadius: BorderRadius.circular(20)
      // ),

      child: Column(
        children: <Widget>[
          new Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            child: new InkWell(
              //按压时候的背景色圆角
              // borderRadius: BorderRadius.circular(100),
              // 去除按压渐变色
              splashColor: Colors.transparent,
              //去除高亮颜色
              highlightColor: Colors.transparent,
              onTap: () {
                this.onTapClick();
              },
              onLongPress: () {
                this.onLongTap();
              },
              child: Column(
                children: <Widget>[
                  //设置控件间距
                  SizedBox(height: 10),
                  new Row(
                    children: [
                      SizedBox(width: 5),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          //Image.network 网络图片 Image.asset 本地图片
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.fill,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      // Expanded 可以自动换行
                      SizedBox(width: 5),
                      Expanded(
                          child: Text(
                        title,
                        style: styleTwo,
                      )),
                      SizedBox(width: 5),
                      // Text
                      Text(
                        subTitle,
                        style: stytleOne,
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    content,
                    style: styleTwo,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ClipRRect(
                      //设置某个角 圆角
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/liu.jpeg",
                        image: imgUrl, //网络图片
                        fit: BoxFit.cover,
                        height: 200,
                        width: width - 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
