
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/display.dart';
import 'package:gazou/get.dart';
import 'package:quiver/async.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
//git追加テスト
class BlazePage extends StatefulWidget {
  const BlazePage({Key? key, required this.camera,required this.imagePath}) : super(key: key);
  final CameraDescription camera;
  final String imagePath;

  //パスも一緒に受け取る
  @override
  State<BlazePage> createState() => _BlazePageState();
}

class _BlazePageState extends State<BlazePage> {
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];
  bool hantei = true;

  String? _extension;
  String? _fileName;
  File? _filePath;
  var offsets = <Offset>[];

  final poseDetector = PoseDetector(options: PoseDetectorOptions());

  Future<void> _blazePose() async {
    String path_1 = widget.imagePath;//
    final inputImage = InputImage.fromFilePath(path_1);
    final List<Pose> poses = await poseDetector.processImage(inputImage);
    var list = <int>[32];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        offsets.add(Offset(landmark.x, landmark.y));
        print("${landmark.type}, x=${landmark.x}, y=${landmark.y}");

        listx.add(landmark.x);
        listy.add(landmark.y);
      });
    }
    print(List<Pose>);
    setState(() {
      _poseFound = true;
    });
    
    //閾値をピクセル値以上に設定する
    var EllorXlist = listx.where((value) => value > 700000).toList();
    var EllorYlist = listy.where((value2) => value2 > 7000000).toList();
    print(listx);
    print(listy);
    print(EllorXlist);
    print(EllorYlist);
    hantei = false;
    //おかしいところ判定
    if (EllorXlist.isEmpty && EllorYlist.isEmpty) {
      hantei = true;
      //trueの時保存するコード書く
    }
    print(hantei);
    
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
      return CustomPaint(
      );
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hantei == false)
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("姿勢がうまく取れていません"),
            content: Text("やり直してください"),
            actions: [
              TextButton(
                child: Text("閉じる"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              //勝手にボタン押せるようにする
              onPressed: () => _blazePose(),
              child: const Text('Run BlazePose'),
              
            ),
            Stack(
              children: <Widget>[_showImage(), _drawPoints()],
            ),
          ],
        ),
      ),
    );
  }
}