import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';

class RowExample extends StatefulWidget {
  @override
  _RowExampleState createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  List<Widget> _columns;

  @override
  void initState() {
    super.initState();
    _columns = <Widget>[
       Card(
        child: Container(
          height: 100.0,
          width: 200.0,
          child: Column(
            children: <Widget>[
              Text('内容1'),
              Icon(Icons.home)
            ],
          ),
        ),
        key: ValueKey('1')
      ),
      Card(
        child: Container(
          height: 100.0,
          width: 200.0,
          child: Column(
            children: <Widget>[
              Text('内容2'),
              Icon(Icons.home)
            ],
          ),
        ),
        key: ValueKey('2')
      ),
      Card(
        child: Container(
          height: 100.0,
          width: 200.0,
          child: Column(
            children: <Widget>[
              Text('内容3'),
              Icon(Icons.home)
            ],
          ),
        ),
        key: ValueKey('3')
      ),
      // Image.network('https://www.itying.com/images/flutter/1.png', key: ValueKey('1')),
      // Image.network('https://www.itying.com/images/flutter/2.png', key: ValueKey('2')),
      // Image.network('https://www.itying.com/images/flutter/3.png', key: ValueKey('3')),
      // Image.asset('assets/river1.jpg', key: ValueKey('river1.jpg')),
      // Image.asset('assets/river2.jpg', key: ValueKey('river2.jpg')),
      // Image.asset('assets/river3.jpg', key: ValueKey('river3.jpg')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget col = _columns.removeAt(oldIndex);
        _columns.insert(newIndex, col);
      });
    }

    return ReorderableRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _columns,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
    );
  }
}