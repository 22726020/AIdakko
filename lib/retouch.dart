import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gazou/evaluation.dart';
import 'package:gazou/blazepaint.dart';


class Retouch1 extends StatefulWidget {
  const Retouch1({Key? key,required this.path1, required this.path2, required this.path3})
      : super(key: key);
  final String path1;
  final String path2;
  final String path3;

  @override
  Retouch1State createState() => Retouch1State();
}

class Retouch1State extends State<Retouch1> {
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
            File(widget.path1)
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
              MaterialPageRoute(builder: (context) => BlazeLandmarkPage2(path1: widget.path1,path2: widget.path2,path3:widget.path3,offsets1: _points),
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

class Retouch2 extends StatefulWidget {
  const Retouch2({Key? key,required this.path1, required this.path2, required this.path3,required this.offsets1})
      : super(key: key);
  final String path1;
  final String path2;
  final String path3;
  final List<Offset> offsets1;
  @override
  Retouch2State createState() => Retouch2State();
}

class Retouch2State extends State<Retouch2> {
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
    List<String> landmarks = ["Nose","Right_shoulder","Right_elbow","Right_wrist","Right_hip","Right_knee","Right_ankle","修正完了"];
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
            File(widget.path2)
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
            painter: PaintLineRight(_points),
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
              MaterialPageRoute(builder: (context) => BlazeLandmarkPage3(path1: widget.path1, path2: widget.path2, path3: widget.path3, offsets1: widget.offsets1, offsets2: _points)
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

class Retouch3 extends StatefulWidget {
  const Retouch3({Key? key,required this.path1, required this.path2, required this.path3,required this.offsets1,required this.offsets2})
      : super(key: key);
  final String path1;
  final String path2;
  final String path3;
  final List<Offset> offsets1;
  final List<Offset> offsets2;
  @override
  Retouch3State createState() => Retouch3State();
}

class Retouch3State extends State<Retouch3> {
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
    List<String> landmarks = ["Nose","Left_shoulder","Left_elbow","Left_wrist","Left_hip","Left_knee","Left_ankle","修正完了"];
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
            File(widget.path3)
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
            painter: PaintLineLeft(_points),
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
              MaterialPageRoute(builder: (context) => Evaluation(path1: widget.path1, path2: widget.path2, path3: widget.path3, offsets1: widget.offsets1, offsets2: widget.offsets2,offsets3: _points),
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

//正面用
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

//右用
class PaintLineRight extends CustomPainter{
  final List<Offset> _points;
  

  PaintLineRight(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    paint.strokeWidth = 5;
    paint.color = Colors.green;
    // 点と点を結ぶ
    canvas.drawLine(_points[0], _points[1], paint);
    canvas.drawLine(_points[1], _points[2], paint);
    canvas.drawLine(_points[2], _points[3], paint);
    canvas.drawLine(_points[1], _points[4], paint);
    canvas.drawLine(_points[4], _points[5], paint);
    canvas.drawLine(_points[5], _points[6], paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//左用
class PaintLineLeft extends CustomPainter{
  final List<Offset> _points;
  

  PaintLineLeft(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    paint.strokeWidth = 5;
    paint.color = Colors.green;
    // 点と点を結ぶ
    canvas.drawLine(_points[0], _points[1], paint);
    canvas.drawLine(_points[1], _points[2], paint);
    canvas.drawLine(_points[2], _points[3], paint);
    canvas.drawLine(_points[1], _points[4], paint);
    canvas.drawLine(_points[4], _points[5], paint);
    canvas.drawLine(_points[5], _points[6], paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

