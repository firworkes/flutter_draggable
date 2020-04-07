import 'package:flutter/material.dart';
import '../components/TableContent.dart';
import '../components/TableTextFied.dart';
import '../components/TableTextFied.dart';

class NewTable3 extends StatefulWidget {
  NewTable3({Key key}) : super(key: key);

  @override
  _NewTable3State createState() => _NewTable3State();
}

class _NewTable3State extends State<NewTable3> {
  // var childData;
  var _username = new TextEditingController();   //初始化的时候给表单赋值

  //监听文本输入框焦点
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {

    _focusNode.addListener(() {
      //失去焦点
      if (!_focusNode.hasFocus) {
        for(var i=0; i < listData.length;i++) {
            setState(() {
            
              listData[i]['edit'] = '1';
            
          });
        }
      }
    });
    super.initState();
  }

  List listData = [
    {'name': '小强', 'age': '19', 'sex': '男','edit': '1'},
    {'name': '小明', 'age': '29', 'sex': '男','edit': '1'},
    {'name': '小红', 'age': '39', 'sex': '女','edit': '1'},
    {'name': '小白', 'age': '23', 'sex': '男','edit': '1'},
  ];

  dynamic _MyTableLData() {
    dynamic content;

    List<Widget> newData = <Widget> [
      Row(
        children: <Widget>[
          TableTextFied(
            height: 50,
            tablevalue: Text('姓名'),
          ),
          TableTextFied(
            height: 50,
            tablevalue: Text('年龄'),
          ),
          TableTextFied(
            height: 50,
            tablevalue: Text('性别'),
          ),
        ],
      )
    ];

    for(var i=0; i < listData.length; i++) {

      content = LongPressDraggable(
          //拖拽时原位显示的容器
          childWhenDragging: Row(
            children: <Widget>[
              TableTextFied(
                tablevalue: Text(listData[i]['name']),
              ),
              TableTextFied(
                tablevalue: Text(listData[i]['age']),
              ),
              TableTextFied(
                tablevalue: Text(listData[i]['sex']),
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
              });
            },
            builder: (context, accepted, rejected){

            return Row(
              children: <Widget>[
                // TableContent(editData: listData[i], item: 'name'),
                GestureDetector(
                  //表格内容点击
                  onTap: () {
                    //如果表格内容有一个文本框聚焦，那么其他内容不显示文本框
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                    setState(() {
                      //点击对应单元格 变为可编辑状态
                      listData[i]['edit'] = '2';
                      //TextField的初始值等于 编辑后的文本信息
                      _username.text = listData[i]['name'];
                    });
                  },
                  child: TableTextFied(
                    tablevalue: listData[i]['edit'] == '2'
                    ? TextField(
                        //获取文本输入的值
                        onChanged: (value) {
                          setState(() {
                            //保存输入后的文本信息
                            listData[i]['name'] = value;
                          });
                        },

                        autofocus: true,
                        controller: _username, //绑定值
                        maxLines: 1,
                        style: TextStyle(fontSize: 18.0),
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0), //边框线圆角
                          ),
                          // border: InputBorder.none, //取消边框线
                          filled: true, //开启背景颜色
                          fillColor: Colors.white, //背景颜色
                          // hintText: "输入"
                        ),
                      )
                    : Text(listData[i]['name']),
                  ),
                ),
                GestureDetector(
                  //表格内容点击
                  onTap: () {

                    //如果表格内容有一个文本框聚焦，那么其他内容不显示文本框
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                    setState(() {
                      //点击对应单元格 变为可编辑状态
                      listData[i]['edit'] = '2';
                      //TextField的初始值等于 编辑后的文本信息
                      _username.text = listData[i]['age'];
                    });
                  
                  },
                  child: TableTextFied(
                    tablevalue: 
                          // listData[i]['edit'] == '2'
                          // ? TextField(
                          //     //获取文本输入的值
                          //     onChanged: (value) {
                          //       setState(() {
                          //         //保存输入后的文本信息
                          //         listData[i]['age'] = value;
                          //       });
                          //     },

                          //     autofocus: true,
                          //     controller: _username, //绑定值
                          //     maxLines: 1,
                          //     style: TextStyle(fontSize: 18.0),
                          //     focusNode: _focusNode,
                          //     decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.all(5.0),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(6.0), //边框线圆角
                          //       ),
                          //       // border: InputBorder.none, //取消边框线
                          //       filled: true, //开启背景颜色
                          //       fillColor: Colors.white, //背景颜色
                          //       // hintText: "输入"
                          //     ),
                          //   )
                          // : 
                          Text(listData[i]['age']),
                  ),
                ),
                TableTextFied(
                  tablevalue: Text(listData[i]['sex']),
                ),

              ],
            );
          }),
          // 拖拽时的样式
        feedback: Material(
          child: Row(
            children: <Widget>[
              TableTextFied(
                  tablevalue: Text(listData[i]['name']),
                ),
              TableTextFied(
                  tablevalue: Text(listData[i]['age']),
                ),
              TableTextFied(
                  tablevalue: Text(listData[i]['sex']),
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
    return GestureDetector( //获取全屏点击
    behavior: HitTestBehavior.translucent,
    onTap: () {
        _focusNode.unfocus();
        // 触摸收起键盘
        // FocusScope.of(context).requestFocus(FocusNode());
    },

    child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _MyTableLData(),
          ),
          SizedBox(height:20),
          Container(
            child: RaisedButton(
            child: Text('添加行'),
              onPressed: () {
                setState(() {
                  this.listData.add(
                    {'name': '', 'age': '', 'sex': ''}
                  );
                });
              }
            ),
          ),
          Container(
            child: RaisedButton(
            child: Text('添加列'),
              onPressed: () {
                setState(() {
                  for(var item in this.listData) {
                    // item
                    item['id'] = '1111';
                    print(item);
                  }
                });
              }
            ),
          )
          
        ],
      
      )
    );

  }
}
