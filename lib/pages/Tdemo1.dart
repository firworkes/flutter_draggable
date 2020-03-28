import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  List<String> _items1 = List<String>.generate(3, (it) => 'item $it');
  List<String> _items2 = List<String>.generate(3, (it) => 'item $it');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggablePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _createGridView(_items1),
          // SizedBox(height: 100,),
          _createGridView(_items2),

          // DragTarget<String>(
          //     builder: (
          //       BuildContext context,
          //       List<dynamic> accepted,
          //       List<dynamic> rejected,
          //     )
              
          //     {return _createGridView(_items2);},
              
          //     //放到该控件时调用
          //     onAccept: (String data) {

          //       setState(() {
          //         _items2.add(data);
          //         // _items2.insert(index,data);
          //       });
          //       // print(data);
          //     },
          //   ),

          
        ],
      ),
    );
  }

  Widget _createGridView(List<String> _items) {
    return GridView.builder(
      itemCount: _items.length,
      // scrollDirection: Axis.vertical,   //控制水平，垂直方向
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10), // 内边距
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,  //每行列数
        mainAxisSpacing: 10, //主轴方向的间距
        crossAxisSpacing: 10, //横轴方向子元素的间距。
      ),
      itemBuilder: (context, index) {
        return Draggable<String>(
          
          onDragCompleted: (){
            // 在拖动结束后删除数据R
            setState(() {
              // print(index);
              _items.removeAt(index);
            });
          },
          childWhenDragging: Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            foregroundDecoration: BoxDecoration(color: Colors.white30),
            child: Text(
              _items[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
          feedback: Material(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text(
                _items[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // 当前组件的数据
          data: _items[index],
          child: Column(children: <Widget>[
            DragTarget<String>(
              builder: ( context,accepted,rejected,){
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
                print(_items);
                setState(() {
                  _items.add(data);
                  // _items.remove(data);
                  // _items.insert(index,data);
                });
                // print(data);
              },
            ),

            Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
            ),
            Text(_items[index],style: TextStyle(color: Colors.white),),
          ],
          )
        );
      },
    );
  }
}


// Container(
//             color: Colors.blueAccent,
//             alignment: Alignment.center,
//             child: Column(
//               children: <Widget>[
//                 Text(_items[index],style: TextStyle(color: Colors.white),),
//               ],
//             ),
//           ),



