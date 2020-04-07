import 'package:flutter/material.dart';

class TableTextFied extends StatelessWidget {
  double width;
  double height;
  Widget tablevalue;
  TableTextFied({double this.width=130.0, double this.height=30.0, Widget this.tablevalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black),
      )),
      child: this.tablevalue,
    );
  }
}
