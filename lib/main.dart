import 'package:flutter/material.dart';
import './pages/table_example.dart';
import './pages/nested_wrap_example.dart';
import './pages/row_example.dart';
import './pages/Tdemo1.dart';
import './pages/Tdemo2.dart';
import './pages/Tdemo5.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
            body: 
            // Tdemo5()
            // TableExample()
            MyTable()

        )
    );
  }
}


class MyTable extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DataTable(
      
          sortColumnIndex: 1,
          sortAscending: true,
          columns: [
            DataColumn(label: Text('姓名'),tooltip: '长按提示'),
            DataColumn(label: Text('年龄')),
          ],
          rows: [
            DataRow(
              onSelectChanged: (selected) {
                
              },
              cells: [
              DataCell(Text('老孟')),
              DataCell(Text('18')),
            ]
            ),
            DataRow(
              // selected: true,
              cells: [
              DataCell(Text('大黄')),
              DataCell(Text('20')),
            ]
            ),
          ],
        )
      ],
    );


  }
}



