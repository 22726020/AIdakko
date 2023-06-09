import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io'as io;

import 'package:gazou/last.dart';
import 'package:gazou/outget.dart';
import 'package:gazou/inget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:io';//　File
import 'dart:typed_data'; // Uint8List

import 'package:gazou/retouch.dart';
import 'package:gazou/evaluation.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';



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
      child: Image.file(File(widget.path2)),
      ),
      const Text('左画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path3)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          saveImage();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => BlazeLandmarkPage1(inoutcamera: "in",path1: widget.path1,path2: widget.path2,path3:widget.path3),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('姿勢推定部へ',style: TextStyle(fontSize: 25,color: Colors.white)),
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
      child: Image.file(File(widget.path2)),
      ),
      const Text('左画像', style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
      Padding(padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
      child: Image.file(File(widget.path3)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          saveImage();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => BlazeLandmarkPage1(inoutcamera: "out",path1: widget.path1,path2: widget.path2,path3:widget.path3),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 26,
          ),
          child: const Text('姿勢推定部へ',style: TextStyle(fontSize: 25,color: Colors.white)),
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

//正面用
class MyPainter extends CustomPainter{
  final List<Offset> offsets;

  MyPainter(this.offsets);

  @override
  void paint(Canvas canvas, Size size) {
    // var offsets2 = <Offset>[];

    final paint = Paint()..color = Colors.red;
    final radius = size.width / 50;

    final Nose = offsets[0];
    final Left_eye_inner = offsets[1];
    final Left_eye = offsets[2];
    final Left_eye_outer = offsets[3];
    final Right_eye_inner = offsets[4];
    final Right_eye = offsets[5];
    final Right_eye_outer = offsets[6];
    final Left_ear = offsets[7];
    final Right_ear = offsets[8];
    final Left_mouth = offsets[9];
    final Right_mouth = offsets[10];
    final Left_shoulder = offsets[11];
    final Right_shoulder = offsets[12];
    final Left_elbow = offsets[13];
    final Right_elbow = offsets[14];
    final Left_wrist = offsets[15];
    final Right_wrist = offsets[16];
    final Left_pinky = offsets[17];
    final Right_pinky = offsets[18];
    final Left_index = offsets[19];
    final Right_index = offsets[20];
    final Left_thumb = offsets[21];
    final Right_thumb = offsets[22];
    final Left_hip = offsets[23];
    final Right_hip = offsets[24];
    final Left_knee = offsets[25];
    final Right_knee = offsets[26];
    final Left_ankle = offsets[27];
    final Right_ankle = offsets[28];
    final Left_heel = offsets[29];
    final Right_heel = offsets[30];
    final Left_foot_index = offsets[31];
    final Right_foot_index = offsets[32];

    // offsets2.add(Nose);
    // offsets2.add(Left_eye);
    // offsets2.add(Right_eye);
    // offsets2.add(Left_mouth);
    // offsets2.add(Right_mouth);
    // offsets2.add(Left_shoulder);
    // offsets2.add(Right_shoulder);
    // offsets2.add(Left_elbow);
    // offsets2.add(Right_elbow);
    // offsets2.add(Left_wrist);
    // offsets2.add(Right_wrist);
    // offsets2.add(Left_hip);
    // offsets2.add(Right_hip);
    // print(offsets2);

    paint.color = Colors.orange;
    canvas.drawCircle(Nose, radius, paint);
    canvas.drawCircle(Left_shoulder, radius, paint);
    canvas.drawCircle(Right_shoulder, radius, paint);
    canvas.drawCircle(Left_elbow, radius, paint);
    canvas.drawCircle(Right_elbow, radius, paint);
    canvas.drawCircle(Left_wrist, radius, paint);
    canvas.drawCircle(Right_wrist, radius, paint);
    canvas.drawCircle(Left_hip, radius, paint);
    canvas.drawCircle(Right_hip, radius, paint);
    canvas.drawCircle(Left_eye, radius, paint);
    canvas.drawCircle(Right_eye, radius, paint);
    canvas.drawCircle(Left_mouth, radius, paint);
    canvas.drawCircle(Right_mouth, radius, paint);
    
    paint.strokeWidth = 5;
    paint.color = Colors.green;
    canvas.drawLine(Left_mouth, Right_mouth, paint);
    canvas.drawLine(Right_shoulder, Left_shoulder, paint);
    canvas.drawLine(Right_shoulder, Right_elbow, paint);
    canvas.drawLine(Left_shoulder, Left_elbow, paint);
    canvas.drawLine(Left_elbow, Left_wrist, paint);
    canvas.drawLine(Right_elbow, Right_wrist, paint);
    canvas.drawLine(Left_shoulder, Left_hip, paint);
    canvas.drawLine(Right_shoulder, Right_hip, paint);
    canvas.drawLine(Right_hip, Left_hip, paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//右用
class MyPainterRight extends CustomPainter{
  final List<Offset> offsets;
  String inoutcamera;
  MyPainterRight(this.offsets,this.inoutcamera);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    final radius = size.width / 50;

    final Nose = offsets[0];
    final Left_eye_inner = offsets[1];
    final Left_eye = offsets[2];
    final Left_eye_outer = offsets[3];
    final Right_eye_inner = offsets[4];
    final Right_eye = offsets[5];
    final Right_eye_outer = offsets[6];
    final Left_ear = offsets[7];
    final Right_ear = offsets[8];
    final Left_mouth = offsets[9];
    final Right_mouth = offsets[10];
    final Left_shoulder = offsets[11];
    final Right_shoulder = offsets[12];
    final Left_elbow = offsets[13];
    final Right_elbow = offsets[14];
    final Left_wrist = offsets[15];
    final Right_wrist = offsets[16];
    final Left_pinky = offsets[17];
    final Right_pinky = offsets[18];
    final Left_index = offsets[19];
    final Right_index = offsets[20];
    final Left_thumb = offsets[21];
    final Right_thumb = offsets[22];
    final Left_hip = offsets[23];
    final Right_hip = offsets[24];
    final Left_knee = offsets[25];
    final Right_knee = offsets[26];
    final Left_ankle = offsets[27];
    final Right_ankle = offsets[28];
    final Left_heel = offsets[29];
    final Right_heel = offsets[30];
    final Left_foot_index = offsets[31];
    final Right_foot_index = offsets[32];
    //アウトカメラの時
    if(inoutcamera == "out"){
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Right_shoulder, radius, paint);
      canvas.drawCircle(Right_elbow, radius, paint);
      canvas.drawCircle(Right_wrist, radius, paint);
      canvas.drawCircle(Right_hip, radius, paint);
      canvas.drawCircle(Right_knee, radius, paint);
      canvas.drawCircle(Right_ankle, radius, paint);
      
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      canvas.drawLine(Nose, Right_shoulder, paint);
      canvas.drawLine(Right_shoulder, Right_elbow, paint);
      canvas.drawLine(Right_elbow, Right_wrist, paint);
      canvas.drawLine(Right_shoulder, Right_hip, paint);
      canvas.drawLine(Right_knee, Right_hip, paint);
      canvas.drawLine(Right_knee, Right_ankle, paint);
    }
    //インカメラの時
    if(inoutcamera == "in"){
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Left_shoulder, radius, paint);
      canvas.drawCircle(Left_elbow, radius, paint);
      canvas.drawCircle(Left_wrist, radius, paint);
      canvas.drawCircle(Left_hip, radius, paint);
      canvas.drawCircle(Left_knee, radius, paint);
      canvas.drawCircle(Left_ankle, radius, paint);
      
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      canvas.drawLine(Nose, Left_shoulder, paint);
      canvas.drawLine(Left_shoulder, Left_elbow, paint);
      canvas.drawLine(Left_elbow, Left_wrist, paint);
      canvas.drawLine(Left_shoulder, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_ankle, paint);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//左用
class MyPainterLeft extends CustomPainter{
  final List<Offset> offsets;
  String inoutcamera;
  MyPainterLeft(this.offsets,this.inoutcamera);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()..color = Colors.red;
    final radius = size.width / 50;

    final Nose = offsets[0];
    final Left_eye_inner = offsets[1];
    final Left_eye = offsets[2];
    final Left_eye_outer = offsets[3];
    final Right_eye_inner = offsets[4];
    final Right_eye = offsets[5];
    final Right_eye_outer = offsets[6];
    final Left_ear = offsets[7];
    final Right_ear = offsets[8];
    final Left_mouth = offsets[9];
    final Right_mouth = offsets[10];
    final Left_shoulder = offsets[11];
    final Right_shoulder = offsets[12];
    final Left_elbow = offsets[13];
    final Right_elbow = offsets[14];
    final Left_wrist = offsets[15];
    final Right_wrist = offsets[16];
    final Left_pinky = offsets[17];
    final Right_pinky = offsets[18];
    final Left_index = offsets[19];
    final Right_index = offsets[20];
    final Left_thumb = offsets[21];
    final Right_thumb = offsets[22];
    final Left_hip = offsets[23];
    final Right_hip = offsets[24];
    final Left_knee = offsets[25];
    final Right_knee = offsets[26];
    final Left_ankle = offsets[27];
    final Right_ankle = offsets[28];
    final Left_heel = offsets[29];
    final Right_heel = offsets[30];
    final Left_foot_index = offsets[31];
    final Right_foot_index = offsets[32];

    //アウトカメラの時
    if(inoutcamera == "out"){
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Left_shoulder, radius, paint);
      canvas.drawCircle(Left_elbow, radius, paint);
      canvas.drawCircle(Left_wrist, radius, paint);
      canvas.drawCircle(Left_hip, radius, paint);
      canvas.drawCircle(Left_knee, radius, paint);
      canvas.drawCircle(Left_ankle, radius, paint);
      
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      canvas.drawLine(Nose, Left_shoulder, paint);
      canvas.drawLine(Left_shoulder, Left_elbow, paint);
      canvas.drawLine(Left_elbow, Left_wrist, paint);
      canvas.drawLine(Left_shoulder, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_ankle, paint);
    }
    //インカメラの時
    if(inoutcamera == "in"){
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Right_shoulder, radius, paint);
      canvas.drawCircle(Right_elbow, radius, paint);
      canvas.drawCircle(Right_wrist, radius, paint);
      canvas.drawCircle(Right_hip, radius, paint);
      canvas.drawCircle(Right_knee, radius, paint);
      canvas.drawCircle(Right_ankle, radius, paint);
      
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      canvas.drawLine(Nose, Right_shoulder, paint);
      canvas.drawLine(Right_shoulder, Right_elbow, paint);
      canvas.drawLine(Right_elbow, Right_wrist, paint);
      canvas.drawLine(Right_shoulder, Right_hip, paint);
      canvas.drawLine(Right_knee, Right_hip, paint);
      canvas.drawLine(Right_knee, Right_ankle, paint);
    }




  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


//姿勢推定描画
//正面画像
class BlazeLandmarkPage1 extends StatefulWidget {
  const BlazeLandmarkPage1({Key? key,required this.inoutcamera,required this.path1, required this.path2, required this.path3})
      : super(key: key);
  final String path1;
  final String path2;
  final String path3;
  final String inoutcamera;
  @override
  State<BlazeLandmarkPage1> createState() => BlazeLandmarkPage1State();
}

class BlazeLandmarkPage1State extends State<BlazeLandmarkPage1> {
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];

  int count = 0;

  String? _extension;
  String? _fileName;
  File? _filePath;
  var offsets = <Offset>[];

  final _points = <Offset>[];

  final poseDetector = PoseDetector(options: PoseDetectorOptions());
  Future<void> _blazePose() async {
    String path = widget.path1; //
    final inputImage = InputImage.fromFilePath(path);
    final List<Pose> poses = await poseDetector.processImage(inputImage);

    //デバイスのサイズ取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    
    //初期化
    listx = [];
    listy = [];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        //比率を合わせる
        offsets.add(Offset(landmark.x/480*deviceWidth, landmark.y/960*deviceHeight));
        // print("${landmark.type}, x=${landmark.x}, y=${landmark.y}");

        listx.add(landmark.x);
        listy.add(landmark.y);
      });
    }
    setState(() {
      _poseFound = true;
    });
  }

 // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
      // details.localPositionが座標値
      print(details.localPosition);
    });
  }

  // タッチしたら描画をクリアする
  void _clearPoints(){
    setState((){
      offsets.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      _blazePose();
      count++;
    }
    
    return Scaffold(
      appBar:  AppBar(centerTitle: true,title:  Text("正面姿勢推定結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),

      body: Stack(
        children: <Widget>[

          Image.file(
            File(widget.path1)
          ),
          GestureDetector(
          // カスタムペイント
          child: CustomPaint(
            painter: MyPainter(offsets),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
        //ロングプレスしたら描画クリア
        onLongPress: () => _clearPoints(),
        //離したら再度blaze実行し、描画
        onLongPressEnd: (details) => _blazePose(),
      ),
      //→paint.dart
      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.007),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Retouch1(inoutcamera: widget.inoutcamera,path1: widget.path1, path2: widget.path2, path3: widget.path3)
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('修正する',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.26),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlazeLandmarkPage2(inoutcamera: widget.inoutcamera,path1: widget.path1,path2: widget.path2,path3:widget.path3,offsets1: offsets),
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('次へ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
      ],
          ),
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
      
  
  }
}



//姿勢推定描画
//右画像
class BlazeLandmarkPage2 extends StatefulWidget {
  const BlazeLandmarkPage2({Key? key,required this.inoutcamera,required this.path1, required this.path2, required this.path3,required this.offsets1})
      : super(key: key);
  final String inoutcamera;
  final String path1;
  final String path2;
  final String path3;
  final List<Offset> offsets1;
  @override
  State<BlazeLandmarkPage2> createState() => BlazeLandmarkPage2State();
}

class BlazeLandmarkPage2State extends State<BlazeLandmarkPage2> {
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];

  int count = 0;

  String? _extension;
  String? _fileName;
  File? _filePath;
  var offsets = <Offset>[];


  final _points = <Offset>[];

  final poseDetector = PoseDetector(options: PoseDetectorOptions());
  Future<void> _blazePose() async {
    String path = widget.path2; //
    final inputImage = InputImage.fromFilePath(path);
    final List<Pose> poses = await poseDetector.processImage(inputImage);

    //デバイスのサイズ取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    
    //初期化
    listx = [];
    listy = [];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        //比率を合わせる
        offsets.add(Offset(landmark.x/480*deviceWidth, landmark.y/960*deviceHeight));
        // print("${landmark.type}, x=${landmark.x}, y=${landmark.y}");

        listx.add(landmark.x);
        listy.add(landmark.y);
      });
    }
    setState(() {
      _poseFound = true;
    });
  }

 // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
      // details.localPositionが座標値
      print(details.localPosition);
    });
  }

  // タッチしたら描画をクリアする
  void _clearPoints(){
    setState((){
      offsets.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      _blazePose();
      count++;
    }
    
    return Scaffold(
      appBar:  AppBar(centerTitle: true,title:  Text("右姿勢推定結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),

      body: Stack(
        children: <Widget>[

          Image.file(
            File(widget.path2)
          ),
          GestureDetector(
          // カスタムペイント
          child: CustomPaint(
            painter: MyPainterRight(offsets,widget.inoutcamera),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
        //ロングプレスしたら描画クリア
        onLongPress: () => _clearPoints(),
        //離したら再度blaze実行し、描画
        onLongPressEnd: (details) => _blazePose(),
      ),
      //→paint.dart
      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.007),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Retouch2(inoutcamera: widget.inoutcamera,path1: widget.path1, path2: widget.path2, path3: widget.path3, offsets1: widget.offsets1)
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('修正する',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
          Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.26),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlazeLandmarkPage3(inoutcamera: widget.inoutcamera,path1: widget.path1,path2: widget.path2,path3:widget.path3,offsets1:widget.offsets1,offsets2:offsets),
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('次へ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
      ],
          ),
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
      
  
  }
}

//姿勢推定描画
//左画像
class BlazeLandmarkPage3 extends StatefulWidget {
  const BlazeLandmarkPage3({Key? key,required this.inoutcamera,required this.path1, required this.path2, required this.path3,required this.offsets1,required this.offsets2})
      : super(key: key);
  final String inoutcamera;
  final String path1;
  final String path2;
  final String path3;
  final List<Offset> offsets1;
  final List<Offset> offsets2;
  @override
  State<BlazeLandmarkPage3> createState() => BlazeLandmarkPage3State();
}

class BlazeLandmarkPage3State extends State<BlazeLandmarkPage3> {
  bool _fileSelected = false;
  bool _poseFound = false;
  var listx = [];
  var listy = [];

  int count = 0;

  String? _extension;
  String? _fileName;
  File? _filePath;
  var offsets = <Offset>[];


  final _points = <Offset>[];

  final poseDetector = PoseDetector(options: PoseDetectorOptions());
  Future<void> _blazePose() async {
    String path = widget.path3; //
    final inputImage = InputImage.fromFilePath(path);
    final List<Pose> poses = await poseDetector.processImage(inputImage);

    //デバイスのサイズ取得
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    
    //初期化
    listx = [];
    listy = [];

    for (Pose pose in poses) {
      // to access all landmarks
      pose.landmarks.forEach((_, landmark) {
        //比率を合わせる
        offsets.add(Offset(landmark.x/480*deviceWidth, landmark.y/960*deviceHeight));
        // print("${landmark.type}, x=${landmark.x}, y=${landmark.y}");

        listx.add(landmark.x);
        listy.add(landmark.y);
      });
    }
    setState(() {
      _poseFound = true;
    });
  }

 // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
      // details.localPositionが座標値
      print(details.localPosition);
    });
  }

  // タッチしたら描画をクリアする
  void _clearPoints(){
    setState((){
      offsets.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      _blazePose();
      count++;
    }
    
    return Scaffold(
      appBar:  AppBar(centerTitle: true,title:  Text("左姿勢推定結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),

      body: Stack(
        children: <Widget>[

          Image.file(
            File(widget.path3)
          ),
          GestureDetector(
          // カスタムペイント
          child: CustomPaint(
            painter: MyPainterLeft(offsets,widget.inoutcamera),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
        //ロングプレスしたら描画クリア
        onLongPress: () => _clearPoints(),
        //離したら再度blaze実行し、描画
        onLongPressEnd: (details) => _blazePose(),
      ),
      //→paint.dart
      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.007),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Retouch3(path1: widget.path1, path2: widget.path2, path3: widget.path3, offsets1: widget.offsets1, offsets2: widget.offsets2),
              )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('修正する',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*1.5,left: MediaQuery.of(context).size.height*0.25),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Evaluation(path1: widget.path1,path2: widget.path2,path3:widget.path3,offsets1:widget.offsets1,offsets2:widget.offsets2,offsets3:offsets),
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('次へ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
      ],
          ),
      // body: Center(child: Transform(transform: Matrix4.rotationY(pi),
      // child: Image.file(File(widget.imagePath)),
      // )
      // ),
    );
      
  
  }
}
