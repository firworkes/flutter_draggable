import 'package:flutter/material.dart';

class DataTables extends StatefulWidget {
  DataTables({Key key}) : super(key: key);

  @override
  _DataTablesState createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(label: Text('年龄')),
        DataColumn(label: Text('性别')),
      ], 
      rows: [
        DataRow(cells: [
          DataCell(
            TextField(
              // focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: "输入"
              ), 
            ),
            // Text('小强'),
            showEditIcon: true
          ),
          DataCell(Text('19')),
          DataCell(Text('男')),
        ]),
        DataRow(cells: [
          DataCell(Text('小白')),
          DataCell(Text('29')),
          DataCell(Text('男')),
        ]),
      ]
    );
  }
}


