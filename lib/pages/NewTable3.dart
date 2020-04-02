import 'package:flutter/material.dart';
import '../components/TableContent.dart';

class NewTable3 extends StatefulWidget {
  NewTable3({Key key}) : super(key: key);

  @override
  _NewTable3State createState() => _NewTable3State();
}

class _NewTable3State extends State<NewTable3> {
  var flag=false;

  //监听文本输入框焦点
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      //失去焦点
      if (!_focusNode.hasFocus) {
        setState(() {
          this.flag = false;
        });
      }
    });
    super.initState();
  }

  List listData = [
    {'name': '小强', 'age': '19', 'sex': '男'},
    {'name': '小明', 'age': '29', 'sex': '男'},
    {'name': '小红', 'age': '39', 'sex': '女'},
    {'name': '小白', 'age': '23', 'sex': '男'},
  ];

  dynamic _MyTableLData() {
    dynamic content;

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

    for(var i=0; i < listData.length; i++) {

      content = Draggable(
          //拖拽时原位显示的容器
          childWhenDragging: Row(
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
                child: Text(listData[i]['name']),
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
                child: Text(listData[i]['age']),
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
                child: Text(listData[i]['sex']),
              ),
            ],
          ),
          //传递给DragTarget的数据
          data: listData[i],
          //接收拖拽组件的容器
          child: DragTarget(

            //放到该控件时调用
            onAccept: (data) {
              setState(() {
                
                listData.remove(data);
                listData.insert(i,data);
                // print(i);
              });
            },
            builder: (context, accepted, rejected){

            return Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this.flag = true;
                    });
                    print(listData[i]['name']);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:BorderSide(width: 1,color:Colors.black),
                      )
                    ),
                    child: this.flag == true ?
                    TextField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: "文本输入框"
                      ), 
                    ) 
                    :
                    Text(listData[i]['name']) 
                  ),
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
                  child: Text(listData[i]['age']),
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
                  child: Text(listData[i]['sex']),
                ),

              ],
            );
          }),
          // 拖拽时的样式
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
                child: Text(listData[i]['name']),
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
                child: Text(listData[i]['age']),
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
                child: Text(listData[i]['sex']),
              ),
            ],
          ),
        )
      );
        //添加进主体内容
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
