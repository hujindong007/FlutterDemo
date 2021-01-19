import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePushOne extends StatelessWidget {
  static const String routeName = "/pushOne";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pushOne"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: GridViewDemo(),
      ),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // padding: EdgeInsets.all(16.0),
      // crossAxisCount: 3, //一行上放三列数据
      // crossAxisSpacing: 8.0, //水平距离
      // mainAxisSpacing: 8.0, //垂直距离
      // children: <Widget>[
      //   ItemDemo(
      //     title: "网格列表一",
      //     icon: IconData(0xe800, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表二",
      //     icon: IconData(0xe801, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表三",
      //     icon: IconData(0xe802, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表四",
      //     icon: IconData(0xe803, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表五",
      //     icon: IconData(0xe804, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表六",
      //     icon: IconData(0xe805, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表七",
      //     icon: IconData(0xe806, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表八",
      //     icon: IconData(0xe807, fontFamily: 'MyFlutterApp'),
      //   ),
      //   ItemDemo(
      //     title: "网格列表九",
      //     icon: IconData(0xf008, fontFamily: 'MyFlutterApp'),
      //   ),
      // ],

      // primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          radius: 100.0,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text("He'd have you all unravel at the"),
          color: Colors.teal[100],
        ),
        Icon(Icons.ac_unit),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.teal[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.teal[300],
        ),
        Icon(Icons.airport_shuttle),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
      ],
    );
  }
}
