import 'package:flutter/material.dart';


class TableContent extends StatelessWidget {
  dynamic contentData;
  TableContent({this.contentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.0,
      height: 30.0,
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(width: 1,color:Colors.black),
        )
      ),
      child: Text(contentData),
    );
  }
}

