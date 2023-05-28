import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gazou/evaluation.dart';


class PaintTest extends StatefulWidget {
  const PaintTest({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  PaintTestState createState() => PaintTestState();
}

class PaintTestState extends State<PaintTest> {
final _points = <Offset>[];
int _counter = 0;


  Widget build(BuildContext context) {
    String landmark = "";
    //メモ
    // List<String> landmarks = ["Nose","Left_eye_inner","Left_eye","Left_eye_outer","Right_eye_inner",
    //                           "Right_eye","Right_eye_outer","Left_ear","Right_ear","Left_mouth",
    //                           "Right_mouth","Left_shoulder","Right_shoulder","Left_elbow",
    //                           "Right_elbow","Left_wrist","Right_wrist","Left_pinky",
    //                           "Right_pinky","Left_index","Right_index","Left_thumb",
    //                           "Right_thumb","Left_hip","Right_hip","Left_knee",
    //                           "Right_knee","Left_ankle","Right_ankle","Left_heel",
    //                           "Right_heel","Left_foot_index","Right_foot_index"];
    List<String> landmarks = ["Nose","Left_eye","Right_eye","Left_mouth","Right_mouth","Left_shoulder","Right_shoulder",
                              "Left_elbow","Right_elbow","Left_wrist","Right_wrist",
                              "Left_hip","Right_hip","修正完了"];
    landmark = landmarks[_counter];
    

    return Scaffold(
        // appBar:  AppBar(centerTitle: true,title:  Text(landmark,style:TextStyle(color: Colors.black)),
        // backgroundColor: Color.fromARGB(255, 174, 168, 167)),
      body:Stack(
        children: <Widget>[
          Padding (padding: EdgeInsets.only(top: 60),
          child: Text(landmark + "を押して", style: TextStyle(fontSize: 40,backgroundColor: Colors.orange ,color: Colors.white)),
          ),
          Padding (padding: EdgeInsets.only(top: 120),
          child: Image.file(
            File(widget.imagePath)
          ),
          ),
          GestureDetector(
          // child: Image.asset('dakko.jpg'),
          // TapDownイベントを検知
          onTapDown: _addPoint,
          // カスタムペイント
          child: CustomPaint(
            painter: MyPainter(_points),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
      ),
      GestureDetector(
          // child: Image.asset('dakko.jpg'),
          // TapDownイベントを検知
          onTapDown: _addLine,
          // カスタムペイント
          child: CustomPaint(
            painter: PaintLine(_points),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
      ),
      
      GestureDetector(
          onTap: (){_incrementCounter();}
      ),
      Padding(padding: EdgeInsets.only(top: 750,left: 20),
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EvaluationTest(imagePath:widget.imagePath,offsets:_points),
        )
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(180,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text('修正完了',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
          ),
                    ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        // 点のクリアボタン
        onPressed: _clearPoints,
        tooltip: 'Clear',
        child: Icon(Icons.clear),
      ), 
    );
  }

//変数を数える
    void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

    // タッチした点をクリアする
  void _clearPoints(){
    setState((){
      _points.clear();
      _counter = 0;
    });
  }

  // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
    });
  }

    // 線を追加
  void _addLine(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
    });
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

class PaintLine extends CustomPainter{
  final List<Offset> _points;
  

  PaintLine(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    paint.strokeWidth = 5;
    paint.color = Colors.green;
    // 点と点を結ぶ
    canvas.drawLine(_points[3], _points[4], paint);
    canvas.drawLine(_points[5], _points[6], paint);
    canvas.drawLine(_points[5], _points[7], paint);
    canvas.drawLine(_points[6], _points[8], paint);
    canvas.drawLine(_points[7], _points[9], paint);
    canvas.drawLine(_points[8], _points[10], paint);
    canvas.drawLine(_points[5], _points[11], paint);
    canvas.drawLine(_points[6], _points[12], paint);
    canvas.drawLine(_points[11], _points[12], paint); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

