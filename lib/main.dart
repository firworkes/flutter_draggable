import 'package:flutter/material.dart';
import './pages/table_example.dart';
import './pages/nested_wrap_example.dart';
import './pages/row_example.dart';
import './pages/Tdemo1.dart';
import './pages/Tdemo2.dart';
import './pages/Tdemo5.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
            body: 
            // Tdemo5()
            TableExample()

        )
    );
  }
}


