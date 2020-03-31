import 'package:flutter/material.dart';


  modelBottomSheet(context) async{

      var result=await showModalBottomSheet(
        context:context,
        builder: (context){
            return Container(
              height: double.infinity,
              child: Column(
                children: <Widget>[

                  ListTile(
                    title: Text("分享 A"),
                    onTap: (){
                      Navigator.pop(context,"分享 A");
                    },
                  ),
                  Divider(),
                   ListTile(
                    title: Text("分享 B"),
                    onTap: (){
                       Navigator.pop(context,"分享 B");
                    },
                  ),
                  Divider(),
                   ListTile(
                    title: Text("分享 C"),
                    onTap: (){
                      Navigator.pop(context,"分享 C");
                    },
                  )                
                ],
              ),
            );
        }
      );
  }
