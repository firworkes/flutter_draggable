import 'package:flutter/material.dart';


class TableDrag extends StatefulWidget {
  TableDrag({Key key}) : super(key: key);

  @override
  _TableDragState createState() => _TableDragState();
}

class _TableDragState extends State<TableDrag> {
  String newData = '';
  List<String> _items1 = List<String>.generate(3, (it) => '张飞 $it');
  List<String> _items2 = List<String>.generate(3, (it) => '关羽 $it');

  List listData = [
    {'name': '小强', 'age': '19'},
    {'name': '小明', 'age': '29'},
    {'name': '小红', 'age': '39'},
    {'name': '小白', 'age': '23'},
  ];

  List _Mylist() {
    var newList = listData.map((item) {
      // print(listData.length);
      return 
      // Draggable(
      //   child: DragTarget(builder: (context,accepted,rejected) {
      //     return DataRow(cells: [
      //       DataCell(Text(item['name'])),
      //       DataCell(Text(item['age'])),
      //     ]);
      //   }), 
      //   feedback: Material(
      //     child: Container(
      //       height: 40.0,
      //       width: 100.0,
      //       child: Text('拖动'),
      //     ),
      //   )
      // );
      DataRow(cells: [
        DataCell(Text(item['name']),showEditIcon: true),
        DataCell(Text(item['age'])),
      ]);
    }).toList();
    return newList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: ListView(
        children: <Widget>[
          DataTable(
            columns: [
              DataColumn(label: Text('姓名')),
              DataColumn(label: Text('年龄')),
            ], 
            rows: _Mylist()
          )
        ],
      )
            
      );
    }

  // Widget _getListView(List<String> _items) {
  //   return listData.map(

  //   );
  // }


}