import 'package:flutter/material.dart';

class NewTable2 extends StatelessWidget {
  const NewTable2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    right:BorderSide(width: 1,color:Colors.black),
                    bottom:BorderSide(width: 1,color:Colors.black),
                    top:BorderSide(width: 1,color:Colors.black),
                  )
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    right:BorderSide(width: 1,color:Colors.black),
                    bottom:BorderSide(width: 1,color:Colors.black),
                    top:BorderSide(width: 1,color:Colors.black),
                  )
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom:BorderSide(width: 1,color:Colors.black),
                    top:BorderSide(width: 1,color:Colors.black),
                  ),
                  
                ),
                child: Text('111'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(right:BorderSide(width: 1,color:Colors.black),bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(right:BorderSide(width: 1,color:Colors.black),bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(right:BorderSide(width: 1,color:Colors.black),bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(right:BorderSide(width: 1,color:Colors.black),bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),Container(
                width: 100.0,
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(bottom:BorderSide(width: 1,color:Colors.black))
                ),
                child: Text('111'),
              ),
            ],
          ),
        
        ],
      );
  }
}