import 'package:flutter/material.dart';

class NewTable extends StatefulWidget {
  NewTable({Key key}) : super(key: key);

  @override
  _NewTableState createState() => _NewTableState();
}

class _NewTableState extends State<NewTable> {

  List listData = [
    {'name': '小强', 'age': '19', 'sex': '男'},
    {'name': '小明', 'age': '29', 'sex': '男'},
    {'name': '小红', 'age': '39', 'sex': '女'},
    {'name': '小白', 'age': '23', 'sex': '男'},
  ];

  // List _MyListData() {
  //   var newList = listData.map((value) {
  //     return ReorderableListView(
  //       children: <Widget>[],
  //     );
  //   });
  // }
      _MyListData () {

        for(var item in listData) {
          TableRow (
            children: <Widget>[
              Text(item['name']),
              Text(item['age']),
              Text(item['sex']),
            ]
          );
        }
      return listData;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black
      ),
      children: [
        // TableRow(
        //   children: <Widget>[
        //     SizedBox(
        //       height: 30,
        //       child: Text('姓名',style: TextStyle(fontWeight: FontWeight.bold),),
        //     ),
            
        //     Text('年龄',style: TextStyle(fontWeight: FontWeight.bold),),
        //     Text('性别',style: TextStyle(fontWeight: FontWeight.bold),),
        //   ]
        // ),
        _MyListData()
        // TableRow(
        //   children: [
        //     Text('111'),
        //     Text('111'),
        //     Text('111'),
        //   ]
        // ),
        // TableRow(
        //   children: [
        //     Text('111'),
        //     Text('111'),
        //     Text('111'),
        //   ]
        // ),
        // TableRow(
        //   children: [
        //     Text('111'),
        //     Text('111'),
        //     Text('111'),
        //   ]
        // ),
      ],
    );
  }
}
