import 'dart:io';
import 'dart:math';
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
String human = "あなたの姿勢パターンは？";

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
String human = "あなたの姿勢パターンは？";

//計算する
String _calculation(String human){
  List<Offset> landmarkfront = widget.offsets1;
  List<Offset> landmarkright = widget.offsets2;
  List<Offset> landmarkleft = widget.offsets3;
  List<Offset> landmarks = [];
  
//調整
  if(landmarkfront.length!=13){
    landmarks.add(landmarkfront[0]);
    landmarks.add(landmarkfront[2]);
    landmarks.add(landmarkfront[5]);
    landmarks.add(landmarkfront[9]);
    landmarks.add(landmarkfront[10]);
    landmarks.add(landmarkfront[11]);
    landmarks.add(landmarkfront[12]);
    landmarks.add(landmarkfront[13]);
    landmarks.add(landmarkfront[14]);
    landmarks.add(landmarkfront[15]);
    landmarks.add(landmarkfront[16]);
    landmarks.add(landmarkfront[23]);
    landmarks.add(landmarkfront[24]);
    //戻す
    landmarkfront = landmarks;
  }
  landmarks = [];
    if(landmarkright.length!=7){
    landmarks.add(landmarkright[0]);
    landmarks.add(landmarkright[11]);
    landmarks.add(landmarkright[13]);
    landmarks.add(landmarkright[15]);
    landmarks.add(landmarkright[23]);
    landmarks.add(landmarkright[25]);
    landmarks.add(landmarkright[27]);
    //戻す
    landmarkright = landmarks;
  }
  landmarks = [];
    if(landmarkleft.length!=7){
    landmarks.add(landmarkleft[0]);
    landmarks.add(landmarkleft[12]);
    landmarks.add(landmarkleft[14]);
    landmarks.add(landmarkleft[16]);
    landmarks.add(landmarkleft[24]);
    landmarks.add(landmarkleft[26]);
    landmarks.add(landmarkleft[28]);
    //戻す
    landmarkleft = landmarks;
  }

   //メモ
    // List<String> landmarkfront = [0"Nose",1"Left_eye",2"Right_eye",3"Left_mouth",4"Right_mouth",5"Left_shoulder",6"Right_shoulder",
    //                           7"Left_elbow",8"Right_elbow",9"Left_wrist",10"Right_wrist",11"Left_hip",12"Right_hip"];
    // List<String> landmarkright = [0"Nose",1"Right_shoulder",2"Right_elbow",3"Right_wrist",4"Right_hip",5"Right_knee",6"Right_ankle"];
    // List<String> landmarkleft = [0"Nose",1"Left_shoulder",2"Left_elbow",3"Left_wrist",4"Left_hip",5"Left_knee",6"Left_ankle"];
  
    // String human = "あげています";
    // double righthand = landmarkfront[10].dy -landmarkfront[0].dy;
    // if(righthand>0){
    //   human = "あげていません";
    // }
    // return "右手を $human";
    // }
    // List<Offset> human = landmark;

    // return "人間 $human";
    // }

    //ケンダル分類
    String kendall = "";
    double ankle_knee = 0;
    double ankle_hip = 0;
    double ankle_shoulder = 0;
    String human = "";

    //ankle_knee 数字が大きい方で引いてるから最後に-1をかけていい感じにしてる
    var tmp1 = landmarkright[5] - landmarkright[6];
    ankle_knee = atan(tmp1.dy/tmp1.dx)*180/pi;
    if(ankle_knee>0){
      ankle_knee = (90 - ankle_knee)*-1;
    }
    else{
      ankle_knee = (-90 + ankle_knee.abs())*-1;
    }

    //ankle_hip 
    var tmp2 = landmarkright[4] - landmarkright[6];
    //tmp1のyを使う
    ankle_hip = atan(tmp1.dy/tmp2.dx)*180/pi;
    if(ankle_hip>0){
      ankle_hip = (90 - ankle_hip)*-1;
    }
    else{
      ankle_hip = (-90 + ankle_hip.abs())*-1;
    }

    //ankle_shoulder
    var tmp3 = landmarkright[1] - landmarkright[6];
    //tmp1のyを使う
    ankle_shoulder = atan(tmp1.dy/tmp3.dx)*180/pi;
    if(ankle_shoulder>0){
      ankle_shoulder = (90 - ankle_shoulder)*-1;
    }
    else{
      ankle_shoulder = (-90 + ankle_shoulder.abs())*-1;
    }

    //ケンダル分類
    if(ankle_knee.abs()<10 && ankle_hip.abs()<10 && ankle_shoulder.abs()<10){
      human = "ノーマル";
    }
    else if(ankle_knee.abs()<10 && ankle_hip>10 && ankle_shoulder.abs()<10){
      human = "ロードシス";
    }
    else if(ankle_knee>10 && ankle_hip.abs()<10 && ankle_shoulder.abs()<10){
      human = "スウェイバック";
    }
    else if(ankle_knee<-10 && ankle_hip.abs()<10 && ankle_shoulder<-10){
      human = "カイホロードシス";
    }
    else if(ankle_knee.abs()>10 && ankle_hip>10 && ankle_shoulder.abs()<10){
      human = "フラットバック";
    }
    else {
      human = "不明";
    }

    print(ankle_knee);
    print(ankle_hip);
    print(ankle_shoulder);
    return human;
}
    //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          children: <Widget>[ 
            Image.file(
            File(widget.path2)
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