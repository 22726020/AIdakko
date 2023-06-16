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
  //色
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;


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
      appBar:  AppBar(centerTitle: true,title:  Text('正面を向いてください',style:TextStyle(color: appbar_text_colors)),
      actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
        backgroundColor: appbar_colors),
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
          Opacity(
            opacity: check ? opacity = 0.8 : opacity = 0.8,
            child: Image.asset("assets/syoumen.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.3),
                child:Transform.scale(
                  scale: 2,
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
                ),)
                
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
  //色
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;


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
      appBar:  AppBar(centerTitle: true,title:  Text('⇨を向いてください',style:TextStyle(color: appbar_text_colors)),
      actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
        backgroundColor: appbar_colors),
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
          Opacity(
            opacity: check ? opacity = 0.8 : opacity = 0.8,
            child: Image.asset("assets/⇨.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.3),
                child:Transform.scale(
                  scale: 2,
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
                ),)
                
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
  //色
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;

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
      appBar:  AppBar(centerTitle: true,title:  Text('⇦を向いてください',style:TextStyle(color: appbar_text_colors)),
      actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
        backgroundColor: appbar_colors),
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
          Opacity(
            opacity: check ? opacity = 0.8 : opacity = 0.8,
            child: Image.asset("assets/⇦.png"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top:  MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.3),
                child:Transform.scale(
                  scale: 2,
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
                ),)
                
                ),
              ],
        ),
        ],
      ),
    );
  }
}