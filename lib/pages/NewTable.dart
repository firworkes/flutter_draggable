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


      _MyListData () {
        dynamic content;
        List<TableRow> tlist = <TableRow>[
          TableRow(
            children: [
              SizedBox(
              height: 30,
              child: Text('姓名',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            
            Text('年龄',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('性别',style: TextStyle(fontWeight: FontWeight.bold),),
            ]
          )
        ];

        for(var item in listData) {
          content = 
          // Draggable(
          //   child: DragTarget(builder: null), 
          //   feedback: Material(
          //     child: Row(
          //       children: <Widget>[
          //         Text(item['name']),
          //         Text(item['age']),
          //         Text(item['sex']),
          //       ],
          //     )
              
          //   )
          // );
          TableRow (
            children: [
              Text(item['name']),
              Text(item['age']),
              Text(item['sex']),
            ]
          );
          tlist.add(content);
        }
      return tlist;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black
      ),
      children:  _MyListData()

    );
  }
}
