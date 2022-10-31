import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get3.dart';
import 'package:gazou/save.dart';
import 'package:quiver/async.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:audioplayers/audioplayers.dart';

//git追加テスト
class BlazePage extends StatefulWidget {
  const BlazePage({Key? key, required this.camera, required this.imagePath,required this.path1, required this.path2})
      : super(key: key);
  final CameraDescription camera;
  final String imagePath;
  final String path1;
  final String path2;


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
    String path_1 = widget.imagePath; //
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
    //閾値をピクセル値以上に設定する
    var EllorXlist =
        listx.where((valuex) => valuex > deviceWidth || 0 > valuex).toList();
    var EllorYlist =
        listy.where((valuey) => valuey > deviceHeight || 0 > valuey).toList();
    // print(listx);
    // print(listy);
    print(EllorXlist);
    print(EllorYlist);
    hantei = false;
    //おかしいところ判定
    if (EllorXlist.isEmpty && EllorYlist.isEmpty) {
      hantei = true;
      //trueの時保存するコード書く
    }
    //何も写っていない時を排除
    if (listx.isEmpty && listy.isEmpty) {
      hantei2 = false;
    }
    //エラー判定がfalseの時アラートダイアログを表示
    //範囲外の時
    if (hantei == false) {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("姿勢がうまく取れていません"),
            content: Text("撮影し直してください"),
          ),
        ),
      );
      //1秒後に自動で閉じる
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pop(context),
      );
    }

    //写っていないとき
    if (hantei2 == false) {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("人物が写っていません"),
            content: Text("撮影し直してください"),
          ),
        ),
      );
      //1秒後に自動で閉じる
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pop(context),
      );
    }
    seigyo();
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

  Future<void> seigyo() async {
    //姿勢がきちんと取れているとき次の撮影へ
    if (hantei && hantei2 == true) {
      await Navigator.push(
          context,
          MaterialPageRoute(//Save.dartに
            builder: (context) => SavePage(camera: widget.camera, title: "抱っこアプリ",path1:widget.path1, path2: widget.path2,path3: widget.imagePath),
          ));
    } else {

      //問題があるとき再撮影へ
      _audio.play('keihou.mp3');
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TakePictureScreen3(camera: widget.camera,path1: widget.path1,path2:widget.path2,),
          ));
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
      body: Center(child: Image.file(File(widget.imagePath))),
    );
  }
}
