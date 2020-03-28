import 'package:flutter/material.dart';


class MydragDemo extends StatefulWidget {
  MydragDemo({Key key}) : super(key: key);

  @override
  _MydragDemoState createState() => _MydragDemoState();
}

class _MydragDemoState extends State<MydragDemo> {

  final _titles = ['OC', 'Swift', 'Java', 'C','C++','C#','Dart','Python','Go'];

  // 生成GridView的items
  List<Widget> buildItems() {
    List<Widget> items = List<Widget>();
    _titles.forEach((value) {
      items.add(Container(
          child: Text(value),
        ));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: <Widget>[
        Draggable(
          child: null, 
          feedback: null
        )
      ],
    );
  }
}