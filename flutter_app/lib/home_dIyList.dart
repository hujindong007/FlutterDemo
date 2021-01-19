import 'package:flutter/material.dart';

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
              onTapClick: () {
            print("点击第一行");
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
    return Container(
      padding: EdgeInsets.all(12),
      //裁剪边框
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.black12, width: 1),
      //   // borderRadius: BorderRadius.circular(20)
      // ),

      child: Column(
        children: <Widget>[
          // BorderRadius()
          // ClipRRect(
          // borderRadius: BorderRadius.circular(100),
          // ),
          new Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            child: new InkWell(
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
                        child: Image.network(
                            'https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg'),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(10)),
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
                  // Text(
                  //   title,
                  //   style: stytleOne,
                  // ),
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
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/liu.jpeg",
                        image: imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black12, width: 1),
                    //     borderRadius: BorderRadius.circular(10)),
                  ),
                  // Image.network(
                  //   imgUrl,
                  // decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.black12, width: 1),
                  //           borderRadius: BorderRadius.circular(10)),),
                  // SizedBox(height: 10),
                ],
              ),
            ),
          ),
          // InkWell(
          //   //按压时候的背景色圆角
          //   borderRadius: BorderRadius.circular(100),
          //   // 去除按压渐变色
          //   splashColor: Colors.red,
          //   //去除高亮颜色
          //   highlightColor: Colors.transparent,
          //   onTap: () {
          //     this.onTapClick();
          //   },
          //   onLongPress: () {
          //     this.onLongTap();
          //   },
          //   child: Column(
          //     children: <Widget>[
          //       SizedBox(height: 80),
          //       Row(
          //         children: [
          //           Container(
          //             child: Image.network(
          //                 'https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg'),
          //             width: 80,
          //             height: 80,
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.black12, width: 1),
          //                 borderRadius: BorderRadius.circular(10)),
          //           ),
          //           // Expanded 可以自动换行
          //           Expanded(
          //               child: Text(
          //             title,
          //             style: styleTwo,
          //           )),
          //           // Text
          //           Text(
          //             subTitle,
          //             style: stytleOne,
          //           ),
          //         ],
          //       ),
          //       // Text(
          //       //   title,
          //       //   style: stytleOne,
          //       // ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //         content,
          //         style: styleTwo,
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Image.network(imgUrl),
          //     ],
          //   ),
          // )，
          //   ),
        ],
      ),
    );
  }
}
