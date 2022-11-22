import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
import 'package:quiver/async.dart';
import 'package:gazou/main.dart';
//こんにちは

class OwariPage extends StatefulWidget {
  const OwariPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<OwariPage> createState() => _OwariPageState();
}

class _OwariPageState extends State<OwariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: new Text(widget.title,style:TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 174, 168, 167)),
        body:  Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/dakko2.jpg"),),
            Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 32),
              child: const Text('撮影お疲れ様でした',style: TextStyle(fontSize: 30),),
            ),
           
          const SizedBox(height: 450,),
                Padding(padding: EdgeInsets.only(bottom: 30),
                child:ElevatedButton(
                  onPressed: (){},
                 style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(200, 255, 255, 255),
                    elevation: 16,
                  ),
                  child: Text('評価する',style: TextStyle(fontSize: 50,color: Colors.grey)),
                ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('ホームへ戻る',style: TextStyle(fontSize: 50,color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
