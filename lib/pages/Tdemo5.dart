import 'package:flutter/material.dart';


class Tdemo5 extends StatefulWidget {
  Tdemo5({Key key}) : super(key: key);

  @override
  _Tdemo5State createState() => _Tdemo5State();
}

class _Tdemo5State extends State<Tdemo5> {
  String newData = '';
  List<String> _items1 = List<String>.generate(3, (it) => '张飞 $it');
  List<String> _items2 = List<String>.generate(3, (it) => '关羽 $it');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          //宽高比
          childAspectRatio: 1 / 5,
          children: <Widget>[
            _getListView(_items1),
            // _getListView(_items2)
          ],
        )
            
      );
    }

  Widget _getListView(List<String> _items) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context,index) {
        // print(index);
        return Draggable(
          onDragCompleted: (){
            // 在拖动结束后删除数据R
            setState(() {

              if(_items[index] == newData) {
                _items.removeAt(index);
              }
            });
          },

          data: _items[index],  //DragTarget接收的数据
          //原本的容器
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DragTarget<String>(
                builder: ( context,accepted,rejected,){
                  //显示的容器 也就是 相互接收的容器
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text(
                      _items[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                
                //放到该控件时调用
                onAccept: (String data) {
                  newData = data;
                  setState(() {
                    
                    // _items.add(data);
                    _items.remove(data);
                    _items.insert(index,data);
                    print(index);
                  });
                },
              ),
              
              //原本的容器让它隐藏
              // Container(
              //   height: 10,
              //   width: 0,
              //   color: Colors.blueAccent,
              //   alignment: Alignment.center,
              //   child: Text(_items[index],style: TextStyle(color: Colors.white),),
              // ),
            ],
          ), 


          //拖动时的容器
          feedback: Material(
            child: Column(
            children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text(_items[index],style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          )
        );
      }
    );
  }


}