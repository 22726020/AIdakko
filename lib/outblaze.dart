import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/inget.dart';
import 'package:quiver/async.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/outget.dart';
import 'package:gazou/blazepaint.dart';
import 'package:gazou/evaluation.dart';

//git追加テスト
class OutBlazePage1 extends StatefulWidget {
  const OutBlazePage1({Key? key, required this.camera, required this.imagePath,})
      : super(key: key);
  final CameraDescription camera;
  final String imagePath;

  //パスも一緒に受け取る
  @override
  State<OutBlazePage1> createState() => _OutBlazePage1State();
}

class _OutBlazePage1State extends State<OutBlazePage1> {
  final _audio = AudioCache();
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];
  bool hantei = true;
  bool hantei2 = true;
  int count = 0;
  //色
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;


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
    final int deviceHeight = MediaQuery.of(context).size.height.ceil();
    final int deviceWidth = MediaQuery.of(context).size.width.ceil();
    // print(deviceHeight);
    // print(deviceWidth);
    //初期化
    listx = [];
    listy = [];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        offsets.add(Offset(landmark.x/(480/deviceWidth), landmark.y/(480/deviceWidth)));
        // print("${landmark.type}, x=${landmark.x}, y=${lßndmark.y}");
        listx.add(landmark.x/(480/deviceWidth));
        listy.add(landmark.y/(480/deviceWidth));
      });
    }

    setState(() {
      _poseFound = true;
    });
    //閾値をピクセル値以上に設定する *2をして閾値を緩めに
    var EllorXlist =
        listx.where((valuex) => valuex > deviceWidth || 0 > valuex).toList();
    var EllorYlist =
        listy.where((valuey) => valuey > deviceHeight || 0 > valuey).toList();
    print(listx);
    print(listy);
    // print(EllorXlist);
    // print(EllorYlist);
    hantei = false;
    // print(deviceWidth);
    // print(deviceHeight);
    // print(EllorYlist);
    // print(EllorXlist);
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
        const Duration(seconds: 4),
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
        const Duration(seconds: 4),
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
          MaterialPageRoute(
            builder: (context) => OutTakePicture2(camera: widget.camera,path1: widget.imagePath,offsets1: offsets),
          ));
    } else {

      //問題があるとき再撮影へ
      _audio.play('keihou.mp3');
      await Future.delayed(const Duration(seconds: 4));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OutTakePicture1(camera: widget.camera),
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
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
  }
}

class OutBlazePage2 extends StatefulWidget {
  const OutBlazePage2({Key? key, required this.camera, required this.imagePath,required this.path1,required this.offsets1})
      : super(key: key);
  final CameraDescription camera;
  final String imagePath;
  final String path1;
  final List<Offset> offsets1;

  //パスも一緒に受け取る
  @override
  State<OutBlazePage2> createState() => _OutBlazePage2State();
}

class _OutBlazePage2State extends State<OutBlazePage2> {
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
        offsets.add(Offset(landmark.x/(480/deviceWidth), landmark.y/(480/deviceWidth)));
        // print("${landmark.type}, x=${landmark.x}, y=${lßndmark.y}");
        listx.add(landmark.x/(480/deviceWidth));
        listy.add(landmark.y/(480/deviceWidth));
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
        const Duration(seconds: 4),
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
        const Duration(seconds: 4),
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
          MaterialPageRoute(
            builder: (context) => OutTakePicture3(camera: widget.camera,path1: widget.path1,path2: widget.imagePath, offsets1:widget.offsets1, offsets2:offsets),
          ));
    } else {

      //問題があるとき再撮影へ
      _audio.play('keihou.mp3');
      await Future.delayed(const Duration(seconds: 4));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OutTakePicture2(camera: widget.camera,path1: widget.path1,offsets1: widget.offsets1),
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
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
  }
}

class OutBlazePage3 extends StatefulWidget {
  const OutBlazePage3({Key? key, required this.camera, required this.imagePath,required this.path1,required this.path2,required this.offsets1, required this.offsets2})
      : super(key: key);
  final CameraDescription camera;
  final String imagePath;
  final String path1;
  final String path2;
  final List<Offset> offsets1;
  final List<Offset> offsets2;

  //パスも一緒に受け取る
  @override
  State<OutBlazePage3> createState() => _OutBlazePage3State();
}

class _OutBlazePage3State extends State<OutBlazePage3> {
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
        offsets.add(Offset(landmark.x/(480/deviceWidth), landmark.y/(480/deviceWidth)));
        // print("${landmark.type}, x=${landmark.x}, y=${lßndmark.y}");
        listx.add(landmark.x/(480/deviceWidth));
        listy.add(landmark.y/(480/deviceWidth));
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
        const Duration(seconds: 4),
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
        const Duration(seconds: 4),
        () => Navigator.pop(context),
      );
    }
    seigyo();
  }

  Future<void> seigyo() async {
    //姿勢がきちんと取れているとき次の撮影へ
    if (hantei && hantei2 == true) {
      await Navigator.push(
          context,
          MaterialPageRoute(
            //修正できるページに飛ばす
            // builder: (context) => SavePageOut(camera: widget.camera, title: "抱っこアプリ",path1:widget.path1, path2: widget.path2,path3: widget.imagePath),
            //修正を省略したページに飛ばす
            builder: (context) => Evaluation(path1: widget.path1,path2: widget.path2,path3:widget.imagePath,offsets1:widget.offsets1,offsets2:widget.offsets2,offsets3:offsets,inoutcamera:"out"),
          ));
    } else {
      //問題があるとき再撮影へ
      _audio.play('keihou.mp3');
      await Future.delayed(const Duration(seconds: 4));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OutTakePicture3(camera: widget.camera,path1: widget.path1,path2: widget.path2,offsets1:widget.offsets1, offsets2:widget.offsets2),
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
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
  }
}