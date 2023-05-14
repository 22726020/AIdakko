import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/inget.dart';
import 'package:quiver/async.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

//git追加テスト
class BlazePage extends StatefulWidget {
  const BlazePage({Key? key,})
      : super(key: key);

  //パスも一緒に受け取る
  @override
  State<BlazePage> createState() => _BlazePageState();
}

class _BlazePageState extends State<BlazePage> {
  final _audio = AudioCache();
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];
  bool hantei = true;
  bool hantei2 = true;
  int count = 0;

  String? _extension;
  String? _fileName;
  File? _filePath;
  var offsets = <Offset>[];

  final poseDetector = PoseDetector(options: PoseDetectorOptions());

  Future<void> _blazePose() async {
    String path_1 = "assets/pause.jpg";//
    final inputImage = InputImage.fromFilePath(path_1);
    final List<Pose> poses = await poseDetector.processImage(inputImage);
    //デバイスのサイズ取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    // print(deviceHeight);
    // print(deviceWidth);
    //初期化
    listx = [];
    listy = [];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        offsets.add(Offset(landmark.x, landmark.y));
        // print("${landmark.type}, x=${landmark.x}, y=${landmark.y}");

        listx.add(landmark.x);
        listy.add(landmark.y);
      });
    }

    setState(() {
      _poseFound = true;
    });
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _fileSelected = false;
      _poseFound = false;
      _filePath = null;
    });
  }

  Widget _showImage() {
    if (_fileSelected) {
      return Image.file(_filePath!);
    } else {
      return const Text('');
    }
  }

  Widget _drawPoints() {
    if (_poseFound) {
      return CustomPaint();
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      _blazePose();
      count++;
    }

    return Scaffold(
      //撮った写真を表示
      // appBar: AppBar(title: const Text('撮れた写真')),
      body: Center(child: Image.file(File("assets/pause.jpg"))),
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
  }
}

class MyPainter extends CustomPainter{
  final List<Offset> _points;
  final _rectPaint = Paint()..color = Colors.blue;

  MyPainter(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    // 記憶している点を描画する
    _points.forEach((offset) =>
        // canvas.drawRect(Rect.fromCenter(center: offset, width: 20.0, height: 20.0), _rectPaint));
        canvas.drawCircle(offset, 10, _rectPaint)); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
