import 'dart:io';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/outblaze.dart';
import 'package:gazou/main.dart';
import 'package:quiver/async.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/pause.dart';


/// 写真撮影画面
class OutTakePicture1 extends StatefulWidget {
  const OutTakePicture1({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  OutTakePicture1State createState() => OutTakePicture1State();
}

class OutTakePicture1State extends State<OutTakePicture1> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool check = true;
  double opacity = 0.5;
  int tmp = 0;
  int count = 0;
  final _audio = AudioCache();


  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }




  Widget build(BuildContext context) {
    if (count == 0) {
      _audio.play('syoumen.mp3');
      count++;
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit:StackFit.loose,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 55),
            alignment: Alignment.topCenter,
            child: const Text('正面を向いてください', style: TextStyle(fontSize: 36,backgroundColor: Colors.orange ,color: Colors.white)),
          ),
          Opacity(
            opacity: check ? opacity = 0.6 : opacity = 0.6,
            child: Image.asset("assets/syoumen.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0),
                child:FloatingActionButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  child: const Icon(Icons.home),
                ),
                ),
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.2),
                
                child: FloatingActionButton(
                  onPressed: () async {
                    // 写真を撮る
                    final image = await _controller.takePicture();

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutBlazePage1(imagePath:image.path,camera:widget.camera),
              )
                    );
                    // path を出力
                  },
                  child: const Icon(Icons.camera_alt),
                ),
                ),
              ],
        ),
        ],
      ),
    );
  }
}

/// 写真撮影画面
class OutTakePicture2 extends StatefulWidget {
  const OutTakePicture2({
    Key? key,
    required this.camera,
    required this.path1,
  }) : super(key: key);

  final CameraDescription camera;
  final String path1;

  @override
  OutTakePicture2State createState() => OutTakePicture2State();
}

class OutTakePicture2State extends State<OutTakePicture2> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool check = true;
  double opacity = 0.5;
  int tmp = 0;
  int count = 0;
  final _audio = AudioCache();


  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }




  Widget build(BuildContext context) {
    if (count == 0) {
      _audio.play('migi.mp3');
      count++;
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit:StackFit.loose,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 55),
            alignment: Alignment.topCenter,
            child: const Text('⇨を向いてください', style: TextStyle(fontSize: 36,backgroundColor: Colors.orange ,color: Colors.white)),
          ),
          Opacity(
            opacity: check ? opacity = 0.6 : opacity = 0.6,
            child: Image.asset("assets/⇨.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0),
                child:FloatingActionButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  child: const Icon(Icons.home),
                ),
                ),
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.2),
                
                child: FloatingActionButton(
                  onPressed: () async {
                    // 写真を撮る
                    final image = await _controller.takePicture();

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutBlazePage2(imagePath:image.path,camera:widget.camera, path1:widget.path1),
              )
                    );
                  },
                  child: const Icon(Icons.camera_alt),
                ),
                ),
              ],
        ),
        ],
      ),
    );
  }
}

/// 写真撮影画面
class OutTakePicture3 extends StatefulWidget {
  const OutTakePicture3({
    Key? key,
    required this.camera,
    required this.path1,
    required this.path2,
  }) : super(key: key);

  final CameraDescription camera;
  final String path1;
  final String path2;

  @override
  OutTakePicture3State createState() => OutTakePicture3State();
}

class OutTakePicture3State extends State<OutTakePicture3> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool check = true;
  double opacity = 0.5;
  int tmp = 0;
  int count = 0;
  final _audio = AudioCache();


  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }




  Widget build(BuildContext context) {
    if (count == 0) {
      _audio.play('hidari.mp3');
      count++;
    }
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit:StackFit.loose,
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 55),
            alignment: Alignment.topCenter,
            child: const Text('⇦を向いてください', style: TextStyle(fontSize: 36,backgroundColor: Colors.orange ,color: Colors.white)),
          ),
          Opacity(
            opacity: check ? opacity = 0.6 : opacity = 0.6,
            child: Image.asset("assets/⇦.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0),
                child:FloatingActionButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  child: const Icon(Icons.home),
                ),
                ),
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.2),
                
                child: FloatingActionButton(
                  onPressed: () async {
                    // 写真を撮る
                    final image = await _controller.takePicture();

                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OutBlazePage3(imagePath:image.path,camera:widget.camera, path1:widget.path1,path2:widget.path2),
              )
                    );
                  },
                  child: const Icon(Icons.camera_alt),
                ),
                ),
              ],
        ),
        ],
      ),
    );
  }
}