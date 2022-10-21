import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:gazou/owari.dart';
import 'package:gazou/main.dart';
import 'package:gazou/get.dart';


class SavePage extends StatefulWidget {
  const SavePage({Key? key, required this.camera,required this.title,required this.path1, required this.path2, required this.path3}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;
  final String path2;
  final String path3;

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('確認画面')),
    body: SingleChildScrollView(
      child:Column(
      children: <Widget>[
      Image.file(File(widget.path1)),
      const Padding(padding: EdgeInsets.all(8)),
      Image.file(File(widget.path2)),
      const Padding(padding: EdgeInsets.all(8)),
      Image.file(File(widget.path3)),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => OwariPage(camera:widget.camera,title: "抱っこアプリ"),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          elevation: 26,
          ),
          child: const Text('保存する',style: TextStyle(color: Colors.black)),
          ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
          )
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 26,
          ),
          child: const Text('撮影をやり直す',style: TextStyle(color: Colors.black)),
          ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MyHomePage(camera:widget.camera,title: "抱っこアプリ"),
          )
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 26,
          ),
          child: const Text('ホームへ戻る',style: TextStyle(color: Colors.black)),
          ),
      ],
      ),
      ],
      ),
    ),
  );
  }
}