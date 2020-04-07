import 'package:flutter/material.dart';

class TableTextFied extends StatefulWidget {
  TableTextFied({Key key}) : super(key: key);

  @override
  _TableTextFiedState createState() => _TableTextFiedState();
}

class _TableTextFiedState extends State<TableTextFied> {
  var username = new TextEditingController();  //初始化的时候给表单赋值
  var editData; //需要编辑数据
  var item; //编辑的字段

    FocusNode _focusNode = FocusNode();

  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!_focusNode.hasFocus) {
      print(editData);
      // setState(() {
      //   editData['edit'] = '1';
      // });
    }

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      //获取文本输入的值
      onChanged: (value) {
        setState(() {
          editData[item] = value;
        });
      },
      autofocus: true,
      controller: username, //绑定值
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
    );
  }
}
