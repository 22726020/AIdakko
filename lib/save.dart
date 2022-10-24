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
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text('正面',textAlign: TextAlign.left, style: TextStyle(fontSize: 40,backgroundColor: Colors.indigo ,color: Colors.white)),
      ),
      Padding(padding: const EdgeInsets.all(5),
      child: Image.file(File(widget.path1)),
      ),
      const Text('右',textAlign: TextAlign.left, style: TextStyle(fontSize: 40,backgroundColor: Colors.indigo ,color: Colors.white)),
      Padding(padding: const EdgeInsets.all(5),
      child: Image.file(File(widget.path2)),
      ),
      const Text('左',textAlign: TextAlign.left, style: TextStyle(fontSize: 40,backgroundColor: Colors.indigo ,color: Colors.white)),
      Padding(padding: const EdgeInsets.all(5),
      child: Image.file(File(widget.path3)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          child: const Text('保存する',style: TextStyle(color: Colors.white)),
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
          child: const Text('撮影をやり直す',style: TextStyle(color: Colors.white)),
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
          child: const Text('ホームへ戻る',style: TextStyle(color: Colors.white)),
          ),
      ],
      ),
      ],
      ),
    ),
  );
  }
}