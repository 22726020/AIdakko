import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io'as io;

import 'package:gazou/last.dart';
import 'package:gazou/outget.dart';
import 'package:gazou/inget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:io';//　File
import 'dart:typed_data'; // Uint8List


//自撮りモードセーブページ
class SavePageIn extends StatefulWidget {
  const SavePageIn({Key? key, required this.camera,required this.title,required this.path1, required this.path2, required this.path3}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;
  final String path2;
  final String path3;

  @override
  State<SavePageIn> createState() => _SavePageInState();
}

class _SavePageInState extends State<SavePageIn> {
  // 画像の保存したい
  Future saveImage() async {
    dynamic imgpath1 = io.File(widget.path1).readAsBytes;
    Uint8List imgpath = imgpath1;
    ImageGallerySaver.saveImage(imgpath);
  }
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('確認画面'),backgroundColor: Colors.orange),
    body: SingleChildScrollView(
      child:Column(
      children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text('正面画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      ),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path1)),
      ),
      const Text('右画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path3)),
      ),
      const Text('左画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path2)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          saveImage();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => OwariPage(camera:widget.camera,title: "抱っこ支援アプリ"),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('保存する',style: TextStyle(fontSize: 25,color: Colors.white)),
          ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
          )
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('撮影をやり直す',style: TextStyle(fontSize: 25,color: Colors.white)),
          ),
      ],
      ),
      ],
      ),
    ),
  );
  }
}

//カメラマンモードセーブページ
class SavePageOut extends StatefulWidget {
  const SavePageOut({Key? key, required this.camera,required this.title,required this.path1, required this.path2, required this.path3}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;
  final String path2;
  final String path3;

  @override
  State<SavePageOut> createState() => _SavePageOutState();
}

class _SavePageOutState extends State<SavePageOut> {
  // 画像の保存したい
  Future saveImage() async {
    dynamic imgpath1 = io.File(widget.path1).readAsBytes;
    Uint8List imgpath = imgpath1;
    ImageGallerySaver.saveImage(imgpath);
  }
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('確認画面'),backgroundColor: Colors.orange),
    body: SingleChildScrollView(
      child:Column(
      children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 10),
      child: Text('正面画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      ),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path1)),
      ),
      const Text('右画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path3)),
      ),
      const Text('左画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path2)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          saveImage();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => OwariPage(camera:widget.camera,title: "抱っこ支援アプリ"),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('保存する',style: TextStyle(fontSize: 25,color: Colors.white)),
          ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => OutTakePicture1(camera:widget.camera),
          )
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('撮影をやり直す',style: TextStyle(fontSize: 25,color: Colors.white)),
          ),
      ],
      ),
      ],
      ),
    ),
  );
  }
}