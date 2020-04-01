import 'package:flutter/material.dart';

class NewTable3 extends StatefulWidget {
  NewTable3({Key key}) : super(key: key);

  @override
  _NewTable3State createState() => _NewTable3State();
}

class _NewTable3State extends State<NewTable3> {

  List listData = [
    {'name': '小强', 'age': '19', 'sex': '男'},
    {'name': '小明', 'age': '29', 'sex': '男'},
    {'name': '小红', 'age': '39', 'sex': '女'},
    {'name': '小白', 'age': '23', 'sex': '男'},
  ];

  _MyTableLData() {
    dynamic content;
    int _index;
    List<Widget> newData = <Widget> [
      Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(width: 1,color:Colors.black),
              )
            ),
            child: Text('姓名'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(width: 1,color:Colors.black),
              )
            ),
            child: Text('年龄'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(width: 1,color:Colors.black),
              )
            ),
            child: Text('性别'),
          ),
        ],
      )
    ];

    listData.asMap().keys.map((key) {
      _index = key;
      // print(_index);
    }).toList();
    for(var item in listData) {
      
      content = 
        Draggable(
          data: item,
          child: DragTarget(
            onWillAccept: (data) {
              print(data);
              return data != null;
            },
            //放到该控件时调用
            onAccept: (data) {
              print(data);
              setState(() {
                
                listData.add(data);
                listData.remove(data);
                // listData.insert(index,data);
              // print(index);
              });
            },
            builder: (context, accepted, rejected){
            return Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:BorderSide(width: 1,color:Colors.black),
                    )
                  ),
                  child: Text(item['name']),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:BorderSide(width: 1,color:Colors.black),
                    )
                  ),
                  child: Text(item['age']),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:BorderSide(width: 1,color:Colors.black),
                    )
                  ),
                  child: Text(item['sex']),
                ),
              ],
            );
          }),
        feedback: Material(
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom:BorderSide(width: 1,color:Colors.black),
                  )
                ),
                child: Text(item['name']),
              ),
              Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom:BorderSide(width: 1,color:Colors.black),
                  )
                ),
                child: Text(item['age']),
              ),
              Container(
                alignment: Alignment.center,
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom:BorderSide(width: 1,color:Colors.black),
                  )
                ),
                child: Text(item['sex']),
              ),
            ],
          ),
        )
      );

      newData.add(content);
    }
    return newData;

  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _MyTableLData()
      );
  }
}