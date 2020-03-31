import 'package:flutter/material.dart';
import '../components/ShowModalBottom.dart';
import 'package:reorderables/reorderables.dart';

class TableExample extends StatefulWidget {
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  //The children of ReorderableTableRow must be of type ReorderableTableRow
  List<ReorderableTableRow> _itemRows;

  @override
  void initState() {
    super.initState();
    var data = [
      ['Alex', '20', '苹果', 'X1', '1'],
      ['Bob', '30', '梨子', 'X2', '2'],
      ['Cindy','40', '香蕉', 'X3', '3'],
      ['Duke', '50', '菠萝', 'X4', '4'],
      ['Ellenina', '60', '桃子', 'X5', '5'],
      ['Floral', '70', '西瓜', 'X6', '6'],
    ];

    Widget _textWithPadding(String text) {
      return 
      GestureDetector(
        onTap: (){
          print(text);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(text, textScaleFactor: 1.1),
          // child: TextField(
          //   autofocus: true,
          //   decoration: InputDecoration(
          //       hintText: "用户名或邮箱",
          //   ),
          // ),
        )
      );
    }

    _itemRows = data.map((row) {
      return ReorderableTableRow(
        //a key must be specified for each row
        key: ObjectKey(row),
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _textWithPadding('${row[0]}'),
          _textWithPadding('${row[1]}'),
          _textWithPadding('${row[2]}'),
          _textWithPadding('${row[3]}'),
          _textWithPadding('${row[4]}'),
//          Text('${row[4]}'),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var headerRow = ReorderableTableRow(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Text('书名', textScaleFactor: 1.5),
          onTap: () {
            modelBottomSheet(context);
          },
        ),
        GestureDetector(
          child: Text('作者', textScaleFactor: 1.5),
          onTap: () {
            modelBottomSheet(context);
          },
        ),
        GestureDetector(
          child: Text('出版日期', textScaleFactor: 1.5),
          onTap: () {
            modelBottomSheet(context);
          },
        ),
        GestureDetector(
          child: Text('码洋', textScaleFactor: 1.5),
          onTap: () {
            modelBottomSheet(context);
          },
        ),
        GestureDetector(
          child: Text('实洋', textScaleFactor: 1.5),
          onTap: () {
            modelBottomSheet(context);
          },
        )
      ]
    );

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        ReorderableTableRow row = _itemRows.removeAt(oldIndex);
        _itemRows.insert(newIndex, row);
      });
    }

    return ReorderableTable(
      header: headerRow,
      children: _itemRows,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        //this callback is optional
        debugPrint('${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
    );
  }
}