import 'package:flutter/material.dart';

class TextFocusManagerTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFocusManagerState();
  }
}

class TextFocusManagerState extends State<TextFocusManagerTest>{
  FocusNode text1FocusNode = FocusNode();
  FocusNode text2FocusNode = FocusNode();
  FocusScopeNode _focusScopeNode = FocusScopeNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("TextFocusManagerTest"),),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: text1FocusNode,
                decoration: InputDecoration(
                    hintText: "Input1"
                ),
              ),
              TextField(
                autofocus: true,
                focusNode: text2FocusNode,
                decoration: InputDecoration(
                    hintText: "Input2"
                ),
              ),
              Builder(
                builder: (context) => Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){
                        if(_focusScopeNode == null) _focusScopeNode = FocusScope.of(context);

                        if(text2FocusNode.hasFocus){
                          print("focus to 1");
                          text2FocusNode.unfocus();
                          _focusScopeNode.requestFocus(text1FocusNode);
                        }else if(text1FocusNode.hasFocus){
                          print("focus to 2");
                          text1FocusNode.unfocus();
                          _focusScopeNode.requestFocus(text2FocusNode);
                        }
                      },
                      child: Text("移动焦点"),
                    ),
                    RaisedButton(
                      onPressed: (){
                        if(text2FocusNode.hasFocus){
                          text2FocusNode.unfocus();
                        }else if(text1FocusNode.hasFocus){
                          text1FocusNode.unfocus();
                        }
                      },
                      child: Text("隐藏键盘"),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}