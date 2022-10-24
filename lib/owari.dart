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
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                image: NetworkImage(
                  "https://www.angeliebe.co.jp/html/upload/save_image/product/50460/50460-190_l4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 32),
              child: const Text('撮影お疲れ様でした',style: TextStyle(fontSize: 30),),
            ),
           
          const SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MyHomePage(camera:widget.camera,title: "抱っこアプリ"),
                    )
                    );
                    },
                    style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 204, 203),
                    elevation: 26,
                  ),
          child: const Text('ホームへ戻る',style: TextStyle(color: Colors.black)),
          ),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 204, 203),
                    elevation: 26,
                  ),
                  child: Text('評価する',style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
          ],
        )
    );
  }
}
