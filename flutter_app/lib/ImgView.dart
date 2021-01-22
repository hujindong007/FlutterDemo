import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImgView extends StatelessWidget {
  static const String routeName = "/imgView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImgView"),
      ),
      body: ImgViewDemo(),
    );
  }
}

class ImgViewDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage("assets/images/wish.png"),
          width: 45,
          height: 45,
        ),
        SizedBox(
          height: 5,
        ),
        // InkWell(
        Container(
          alignment: Alignment.center,
          child: InkWell(
            child: Image.network(
              "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg",
              // color: Colors.yellow,
              height: 100,
              width: 100,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
            onTap: () {
              print("点击照片");
            },
          ),
        ),
        Container(
          child: PhotoView(
            //第三方 双击放大照片
            imageProvider: AssetImage("assets/images/liu.jpeg"),
            enableRotation: true,
          ),
          height: 200,
          width: 200,
        ),
      ],
    );
  }
}

// const Image({
//   ...
//   this.width, //图片的宽
//   this.height, //图片高度
//   this.color, //图片的混合色值
//   this.colorBlendMode, //混合模式
//   this.fit,//缩放模式
//   this.alignment = Alignment.center, //对齐方式
//   this.repeat = ImageRepeat.noRepeat, //重复方式
//   ...
// })
