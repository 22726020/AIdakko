import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gazou/hand20.dart';

//テスト
class EvaluationTest extends StatefulWidget {
  const EvaluationTest({Key? key,required this.imagePath,required this.offsets}) : super(key: key);

  final String imagePath;
  final List<Offset> offsets;
  
  @override
  State<EvaluationTest> createState() => _EvaluationTestState();
}

class _EvaluationTestState extends State<EvaluationTest> {
String human = "評価結果を出す";
String score = "姿勢スコア：計算中";
String advice = "";
String badpoint = "";
String text = "";
//右姿勢からを評価する
String _rightcalculation(String human){
  List<Offset> landmarkright = widget.offsets;
  List<Offset> landmarks = [];
//調整
  landmarks = [];
    if(landmarkright.length!=7){
    landmarks.add(landmarkright[0]);
    landmarks.add(landmarkright[12]);
    landmarks.add(landmarkright[14]);
    landmarks.add(landmarkright[16]);
    landmarks.add(landmarkright[24]);
    landmarks.add(landmarkright[26]);
    landmarks.add(landmarkright[28]);
    //戻す
    landmarkright = landmarks;
  }

   //メモ
    // List<String> landmarkfront = [0"Nose",1"Left_eye",2"Right_eye",3"Left_mouth",4"Right_mouth",5"Left_shoulder",6"Right_shoulder",
    //                           7"Left_elbow",8"Right_elbow",9"Left_wrist",10"Right_wrist",11"Left_hip",12"Right_hip"];
    // List<String> landmarkright = [0"Nose",1"Right_shoulder",2"Right_elbow",3"Right_wrist",4"Right_hip",5"Right_knee",6"Right_ankle"];
    // List<String> landmarkleft = [0"Nose",1"Left_shoulder",2"Left_elbow",3"Left_wrist",4"Left_hip",5"Left_knee",6"Left_ankle"];

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
//肩の平行具合を計算する
String _ShoulderScorecalculation(){
  List<Offset> landmarkfront = widget.offsets;
  List<Offset> landmarks = [];
  double shoulder_angle = 0;
  String ShoulderScore = "";
  var tmp1 = widget.offsets[12] - widget.offsets[11];
  print(tmp1);
  print(atan(tmp1.dy / tmp1.dx));
  print(atan(tmp1.dy / tmp1.dx).abs());
  shoulder_angle = (((atan(tmp1.dy / tmp1.dx)).abs())*180 / pi);
  print(shoulder_angle);
  print(shoulder_angle);
  ShoulderScore = shoulder_angle.toString() + "度です";
  return ShoulderScore;
}
//抱く高さの位置を計算する
String _Hugheightcalculation(){
  List<Offset> landmarkfront = widget.offsets;
  List<Offset> landmarks = [];
  //それぞれの手首の高さ
  int back_hand = 0;
  int hip_hand = 0;
  double back_hand_rate = 0;
  double hip_hand_rate = 0;
  if(widget.offsets[14].dy < widget.offsets[15].dy){
    print("背中を支えている手首はRight_wristです");
    back_hand = 10;
    hip_hand = 9;
  }
  else{
    print("背中を支えている手首はLeft_wristです");
    back_hand = 9;
    hip_hand = 10;
  }
  var hip_midpoint = (widget.offsets[16] + widget.offsets[23])/2;
  var sholder_midpoint = (widget.offsets[10] + widget.offsets[11])/2;
  back_hand_rate = (landmarkfront[back_hand].dy - hip_midpoint.dy)/(sholder_midpoint.dy - hip_midpoint.dy);
  hip_hand_rate = (landmarkfront[hip_hand].dy - hip_midpoint.dy)/(sholder_midpoint.dy - hip_midpoint.dy);
  print(back_hand_rate);
  print(hip_hand_rate);
  //return hip_hand_rate.toString();
  return hip_hand_rate.toString();
}


//姿勢スコアを返す
String _score(String score){
  //int sumscore = 0;
  //human = _calculation(human);
  var ShoulderScore = _ShoulderScorecalculation();
  //score = "姿勢スコア：" + sumscore.toString() + "点";
  score = "肩の平行具合は：" + ShoulderScore.toString() + "度";
  return score;
}

//悪いところを返す
String _badpoint(String badpoint){
  List<String> badpoint_list = ["抱っこの高さが低い","背筋が悪い","aaaa","bbbb"];
  badpoint = badpoint_list[0] + "\n" + badpoint_list[1];
  return badpoint;
}

//アドバイスを返す
String _advice(String advice){
  List<String> advice_list = ["赤ちゃんのほっぺにキス","背筋を伸ばす","aaaa","bbbb"];
  advice = advice_list[0] + "\n" + advice_list[1];
  return advice;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(centerTitle: true,title:  Text("評価結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                  Image.file(
                  File(widget.imagePath)
                ),
                CustomPaint(
                  //引数の渡す方
                  painter: MyPainterRight(widget.offsets),
                  // タッチを有効にするため、childが必要
                  child: Center(),
              ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 10,left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          score = _score(score);
                          text = score;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: Colors.orange,//ボタン背景色
                        elevation: 16,
                      ),
                      child: Text(" 姿勢スコア",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10,left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          badpoint = _badpoint(badpoint);
                          text = badpoint;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: Colors.orange,
                        elevation: 16,
                      ),
                      child: Text("Bad Point",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10,left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          advice = _advice(advice);
                          text = advice;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: Colors.orange,
                        elevation: 16,
                      ),
                      child: Text("アドバイス",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
              ],
            ),
      
                    
            // Text("アドバイス欄",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black)),
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.red)),

      // Padding(padding: EdgeInsets.only(top: 730,left: 20),
      //     child: Text(_calculation(human),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black)),
      // ),
          ],
      ),
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
    landmarks.add(landmarkright[12]);
    landmarks.add(landmarkright[14]);
    landmarks.add(landmarkright[16]);
    landmarks.add(landmarkright[24]);
    landmarks.add(landmarkright[26]);
    landmarks.add(landmarkright[28]);
    //戻す
    landmarkright = landmarks;
  }
  landmarks = [];
    if(landmarkleft.length!=7){
    landmarks.add(landmarkleft[0]);
    landmarks.add(landmarkleft[11]);
    landmarks.add(landmarkleft[13]);
    landmarks.add(landmarkleft[15]);
    landmarks.add(landmarkleft[23]);
    landmarks.add(landmarkleft[25]);
    landmarks.add(landmarkleft[27]);
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
      appBar:  AppBar(centerTitle: true,title:  Text("評価結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),
      body:Stack(
          children: <Widget>[ 
            Image.file(
            File(widget.path2)
          ),
          // カスタムペイント
          CustomPaint(
            //引数の渡す方
            painter: MyPainterRight(widget.offsets2),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
      Padding(padding: EdgeInsets.only(top: 630,left: 20),
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
            child: Text(human,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
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

//右用
class MyPainterRight extends CustomPainter{
  //引数の受け取る方
  List<Offset> offsets;

  MyPainterRight(this.offsets);
  //appberの高さを取得
  // var height = AppBar().preferredSize.height;
  int count = 0;
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()..color = Colors.red;
    final radius = size.width / 50;
    List<Offset> landmarks = [];

    //修正ページのx,y座標と合わせる必要があるため -Offset(0,120) , countで制御
    if(count==0){
      count++;
      if(offsets.length==7){
        landmarks.add(offsets[0]-Offset(0, 120));
        landmarks.add(offsets[1]-Offset(0, 120));
        landmarks.add(offsets[2]-Offset(0, 120));
        landmarks.add(offsets[3]-Offset(0, 120));
        landmarks.add(offsets[4]-Offset(0, 120));
        landmarks.add(offsets[5]-Offset(0, 120));
        landmarks.add(offsets[6]-Offset(0, 120));
      //戻す
      offsets = landmarks;
      }
    }

    
    landmarks =  [];
    if(offsets.length!=7){
      landmarks.add(offsets[0]);
      landmarks.add(offsets[12]);
      landmarks.add(offsets[14]);
      landmarks.add(offsets[16]);
      landmarks.add(offsets[24]);
      landmarks.add(offsets[26]);
      landmarks.add(offsets[28]);

    //戻す
    offsets = landmarks;
  }

    final Nose = offsets[0];
    final Right_shoulder = offsets[1];
    final Right_elbow = offsets[2];
    final Right_wrist = offsets[3];
    final Right_hip = offsets[4];
    final Right_knee = offsets[5];
    final Right_ankle = offsets[6];

    final Right_shoulder_ideal = offsets[1].dy;
    final Right_hip_ideal = offsets[4].dy;
    final Right_knee_ideal = offsets[5].dy;
    final Right_ankle_ideal_x = offsets[6].dx;


   //姿勢推定
    paint.color = Colors.orange;
    canvas.drawCircle(Nose, radius, paint);
    canvas.drawCircle(Right_shoulder, radius, paint);
    canvas.drawCircle(Right_elbow, radius, paint);
    canvas.drawCircle(Right_wrist, radius, paint);
    canvas.drawCircle(Right_hip, radius, paint);
    canvas.drawCircle(Right_knee, radius, paint);
    canvas.drawCircle(Right_ankle, radius, paint);

    //理想姿勢
    paint.color = Colors.red;
    canvas.drawCircle(Offset(Right_ankle_ideal_x,Right_shoulder_ideal) , radius, paint);
    canvas.drawCircle(Offset(Right_ankle_ideal_x,Right_hip_ideal) , radius, paint);
    canvas.drawCircle(Offset(Right_ankle_ideal_x,Right_knee_ideal) , radius, paint);
    canvas.drawCircle(Right_ankle, radius, paint);
    

    //姿勢推定
    paint.strokeWidth = 5;
    paint.color = Colors.green;
    // canvas.drawLine(Nose, Right_shoulder, paint);
    canvas.drawLine(Right_shoulder, Right_elbow, paint);
    canvas.drawLine(Right_elbow, Right_wrist, paint);
    canvas.drawLine(Right_shoulder, Right_hip, paint);
    canvas.drawLine(Right_knee, Right_hip, paint);
    canvas.drawLine(Right_knee, Right_ankle, paint);

    //理想姿勢
    paint.color = Colors.red;
    canvas.drawLine(Offset(Right_ankle_ideal_x,Right_shoulder_ideal), Offset(Right_ankle_ideal_x,Right_hip_ideal), paint);
    canvas.drawLine(Offset(Right_ankle_ideal_x,Right_hip_ideal), Offset(Right_ankle_ideal_x,Right_knee_ideal), paint);
    canvas.drawLine(Offset(Right_ankle_ideal_x,Right_knee_ideal), Right_ankle, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}