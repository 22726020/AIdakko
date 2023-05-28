import 'dart:io';
import 'package:flutter/material.dart';

//テスト
class EvaluationTest extends StatefulWidget {
  const EvaluationTest({Key? key,required this.imagePath,required this.offsets}) : super(key: key);

  final String imagePath;
  final List<Offset> offsets;
  
  @override
  State<EvaluationTest> createState() => _EvaluationTestState();
}

class _EvaluationTestState extends State<EvaluationTest> {
String human = "結果は？";

//計算する
String _calculation(String human){
  List<Offset> landmark = widget.offsets;
  List<Offset> landmarks = [];
  
//調整
  if(landmark.length!=13){
    landmarks.add(landmark[0]);
    landmarks.add(landmark[2]);
    landmarks.add(landmark[5]);
    landmarks.add(landmark[9]);
    landmarks.add(landmark[10]);
    landmarks.add(landmark[11]);
    landmarks.add(landmark[12]);
    landmarks.add(landmark[13]);
    landmarks.add(landmark[14]);
    landmarks.add(landmark[15]);
    landmarks.add(landmark[16]);
    landmarks.add(landmark[23]);
    landmarks.add(landmark[24]);
    //戻す
    landmark = landmarks;
  }
    String human = "あげています";
    double righthand = landmark[10].dy -landmark[0].dy;
    if(righthand>0){
      human = "あげていません";
    }
    return "右手を $human";
    }
    // List<Offset> human = landmark;

    // return "人間 $human";
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children: <Widget>[ 
            Image.file(
            File(widget.imagePath)
          ),

      Padding(padding: EdgeInsets.only(top: 650,left: 20),
        child: ElevatedButton(
            onPressed: (){
              setState(() {
                human = _calculation(human);
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(400,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text(human,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
          ),
                    ),
      // Padding(padding: EdgeInsets.only(top: 730,left: 20),
      //     child: Text(_calculation(human),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black)),
      // ),
          ],
      ),
    );
    }
}

//評価結果を返す
class Evaluation extends StatefulWidget {
  const Evaluation({Key? key,required this.path1, required this.path2, required this.path3,required this.offsets1,required this.offsets2,required this.offsets3})
      : super(key: key);
  final String path1;
  final String path2;
  final String path3;
  final List<Offset> offsets1;
  final List<Offset> offsets2;
  final List<Offset> offsets3;
  @override
  State<Evaluation> createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
String human = "結果は？";

//計算する
String _calculation(String human){
  List<Offset> landmark = widget.offsets1;
  List<Offset> landmarks = [];
  
//調整
  if(landmark.length!=13){
    landmarks.add(landmark[0]);
    landmarks.add(landmark[2]);
    landmarks.add(landmark[5]);
    landmarks.add(landmark[9]);
    landmarks.add(landmark[10]);
    landmarks.add(landmark[11]);
    landmarks.add(landmark[12]);
    landmarks.add(landmark[13]);
    landmarks.add(landmark[14]);
    landmarks.add(landmark[15]);
    landmarks.add(landmark[16]);
    landmarks.add(landmark[23]);
    landmarks.add(landmark[24]);
    //戻す
    landmark = landmarks;
  }
    String human = "あげています";
    double righthand = landmark[10].dy -landmark[0].dy;
    if(righthand>0){
      human = "あげていません";
    }
    return "右手を $human";
    }
    // List<Offset> human = landmark;

    // return "人間 $human";
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children: <Widget>[ 
            Image.file(
            File(widget.path1)
          ),

      Padding(padding: EdgeInsets.only(top: 650,left: 20),
        child: ElevatedButton(
            onPressed: (){
              setState(() {
                human = _calculation(human);
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              fixedSize:const Size(400,60),
              backgroundColor: Colors.orange,
              elevation: 16,
            ),
            child: Text(human,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
          ),
                    ),
      // Padding(padding: EdgeInsets.only(top: 730,left: 20),
      //     child: Text(_calculation(human),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black)),
      // ),
          ],
      ),
    );
    }
}