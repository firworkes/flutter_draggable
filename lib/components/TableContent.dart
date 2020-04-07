import 'package:flutter/material.dart';
import '../components/TableTextFied.dart';

class TableContent extends StatefulWidget {
  TableContent({Key key, this.editData, this.item, this.weibo}) : super(key: key);
  var editData; //需要编辑数据
  String item; //编辑的字段

  Map weibo={'add': '11'};


  @override
  _TableContentState createState() => _TableContentState();
}

class _TableContentState extends State<TableContent> {
  var _username = new TextEditingController(); //初始化的时候给表单赋值

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    if (!_focusNode.hasFocus) {
      // print(!_focusNode.hasFocus);
      // for(var i=0; i < listData.length;i++) {
      //       setState(() {
      //         print(listData[i]);
      //         listData[i]['edit'] = '1';
      //     });
      //   }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //表格内容点击
      onTap: () {
        //如果表格内容有一个文本框聚焦，那么其他内容不显示文本框
        // if (_focusNode.hasFocus) {
        //   _focusNode.unfocus();
        //   print(_focusNode.hasFocus);
        // }
        setState(() {
          //点击对应单元格 变为可编辑状态
          widget.editData['edit'] = '2';
          //TextField的初始值等于 编辑后的文本信息
          _username.text = widget.editData[widget.item];
        });
      },
      child: Container(
          alignment: Alignment.center,
          width: 100.0,
          height: 30.0,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.black),
          )),
          child: widget.editData['edit'] == '2'
              ? TextField(
                  //获取文本输入的值
                  onChanged: (value) {
                    setState(() {
                      //保存输入后的文本信息
                      widget.editData[widget.item] = value;
                    });
                  },
                  onSubmitted: (value) { //内容提交(按回车)的回调
                    setState(() {
                      widget.editData['edit'] = '1';
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
              : Text(widget.editData[widget.item])),
    );
  }
}
