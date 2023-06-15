import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gazou/hand20.dart';

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
  String kendall = "評価結果を出す";
String score = "姿勢スコア：計算中";
String advice = "";
String badpoint = "";
String text = "";
String image = "";
int count = 0;
String aaa = "";
String dir = "front";
String button = "score";
List<String> summraize= [];
List<Offset> offset = [];
String imagescore = "assets/imagescore.png";
String kendall_text = "";
bool tf = true;

//色
var downcolor_1 = Colors.grey;
var downcolor_2 = Colors.grey;
var downcolor_3 = Colors.grey;
var upcolor_1 = Colors.grey;
var upcolor_2 = Colors.grey;
var upcolor_3 = Colors.grey;

List<Offset> _adjust_front(List<Offset> landmarkfront){
  List<Offset> landmarkfront = widget.offsets1;
  List<Offset> landmarks = [];
//正面調整
    if(landmarkfront.length!=9){
    landmarks.add(landmarkfront[0]);
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
  return landmarkfront;
}
//右調整
List<Offset> _adjust_right(List<Offset> landmarkright){
  List<Offset> landmarkright = widget.offsets2;
  List<Offset> landmarks = [];
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
  return landmarkright;
}
//左調整
List<Offset> _adjust_left(List<Offset> landmarkleft){
  List<Offset> landmarkleft = widget.offsets3;
  List<Offset> landmarks = [];
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
  return landmarkleft;
}

//ケンダルを計算する
  List<String> _kendall_classification(){
    List<Offset>landmarkright = [];
    List<String>kendalllist = [];
  //調整済み座標持ってきてる
  landmarkright = _adjust_right(landmarkright);
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
      kendall = "ノーマル";
    }
    else if(ankle_knee.abs()<10 && ankle_hip>10 && ankle_shoulder.abs()<10){
      kendall = "ロードシス";
    }
    else if(ankle_knee>10 && ankle_hip.abs()<10 && ankle_shoulder.abs()<10){
      kendall = "スウェイバック";
    }
    else if(ankle_knee<-10 && ankle_hip.abs()<10 && ankle_shoulder<-10){
      kendall = "カイホロードシス";
    }
    else if(ankle_knee.abs()>10 && ankle_hip>10 && ankle_shoulder.abs()<10){
      kendall = "フラットバック";
    }
    else {
      // kendall = "不明";
      kendall = "ノーマル";//とりあえず
    }

    print(ankle_knee);
    print(ankle_hip);
    print(ankle_shoulder);
    kendalllist.add(kendall);
    kendalllist.add(ankle_knee.toString());
    kendalllist.add(ankle_hip.toString());
    kendalllist.add(ankle_shoulder.toString());

    return kendalllist;
}
//肩の平行具合を計算する
  double _ShoulderScore_calculation(){
    List<Offset>landmarkfront = [];
    //調整済み座標持ってきてる
    landmarkfront = _adjust_front(landmarkfront);

    double shoulder_angle = 0;
    double ShoulderScore = 0;
    var tmp1 = landmarkfront[2] - landmarkfront[1];
    shoulder_angle = (((atan(tmp1.dy / tmp1.dx)).abs())*180 / pi);
    print(shoulder_angle);
    ShoulderScore = shoulder_angle;
    return ShoulderScore;
  }
//抱く高さの位置を計算する
  List<String> _Hugheight_calculation(){
    List<Offset>landmarkfront = [];
    List<String> hugheight = [];
    //調整済み座標持ってきてる
    landmarkfront = _adjust_front(landmarkfront);
    //それぞれの手首の高さ
    int back_hand = 0;
    int hip_hand = 0;
    double back_hand_rate = 0;
    double hip_hand_rate = 0;
    String ishiphand = "";
    if(landmarkfront[5].dy > landmarkfront[6].dy){
      print(landmarkfront[5]);
      print(landmarkfront[6]);
      print("背中を支えている手首はLeft_wristです");
      back_hand = 6;
      hip_hand = 5;
      ishiphand = "Left_wrist";
    }
    else{
      print("背中を支えている手首はRight_wristです");
      back_hand = 5;
      hip_hand = 6;
      ishiphand = "Right_wrist";
    }
    var hip_midpoint = (landmarkfront[7] + landmarkfront[8])/2;
    var sholder_midpoint = (landmarkfront[1] + landmarkfront[2])/2;
    back_hand_rate = (landmarkfront[back_hand].dy - hip_midpoint.dy)/(sholder_midpoint.dy - hip_midpoint.dy);
    hip_hand_rate = (landmarkfront[hip_hand].dy - hip_midpoint.dy)/(sholder_midpoint.dy - hip_midpoint.dy);
    //return hip_hand_rate.toString();
    hugheight.add(hip_hand_rate.toString());
    hugheight.add(back_hand_rate.toString());
    hugheight.add(ishiphand);

    return hugheight;
  }
  //計算した値をリストでまとめて返す”さまらいず”
  //   [1.9385906915861866, 不明, 0.3848952710315345, 0.8713518732334877, Right_wrist,ankle_knee,ankle_hip,ankle_shoulder]
  //   [肩の平行具合、ケンダル、ヒップハンド、バックハンド、イズヒップハンド、膝までの角度、腰までの角度、肩までの角度]
  List<String> _Summraize(){

    List<String> summraize = [];

    var ShoulderScore = _ShoulderScore_calculation();

    var Hugheight = _Hugheight_calculation();

    var kendalllist= _kendall_classification();


    summraize.add(ShoulderScore.toString());

    summraize.add(kendalllist[0]);

    summraize.add(Hugheight[0].toString());
    summraize.add(Hugheight[1].toString());
    summraize.add(Hugheight[2].toString());
    summraize.add(kendalllist[1]);
    summraize.add(kendalllist[2]);
    summraize.add(kendalllist[3]);

    print(summraize);
    return summraize;

  }

//姿勢スコアを返す
  String _score(String score){
    double sumscore = 0;
    var ShoulderScore = _ShoulderScore_calculation();
    var kendall = _kendall_classification()[0];
    var Hugheight = _Hugheight_calculation();

    if(kendall == "ノーマル"){
      sumscore += 33;
    }
    else{
      sumscore += 16.5;
    }

    if(double.parse(Hugheight[0]) > 0.5){
      sumscore += 33;
    }
    if(0.5 > double.parse(Hugheight[0]) && double.parse(Hugheight[0]) > 0.45){
      sumscore += 24.75;
    }
    if(0.45 > double.parse(Hugheight[0]) && double.parse(Hugheight[0]) > 0.40){
      sumscore += 16.5;
    }
    if(0.40 > double.parse(Hugheight[0]) && double.parse(Hugheight[0]) > 0.35){
      sumscore += 8.25;
    }
    else{
      sumscore += 0;
    }

    if(ShoulderScore < 2.8){
      sumscore += 33;
    }
    if(2.8 < ShoulderScore && ShoulderScore < 3.0){
      sumscore += 24.75;
    }
    if(3.0 < ShoulderScore && ShoulderScore < 3.2){
      sumscore += 16.5;
    }
    if(3.2 < ShoulderScore && ShoulderScore < 3.4){
      sumscore += 8.25;
    }
    else{
      sumscore += 0;
    }

    int tmp = sumscore.toInt();
    sumscore = tmp.toDouble();

    score = "抱っこの点数:" + sumscore.ceil().toString() + "点";
    return score;
  }

  //悪いところを返す
  String _badpoint(String badpoint){
    var summraize = _Summraize();
    var point = _triangular_chart();
    List<String> badpoint = [];
    String badtext = "";
    int badcount = 0;

    List<String> bad_kendall_list
    = ["横から見た姿勢：",
      "耳たぶ・肩峰・股関節・膝・くるぶしの5点が床から一直線に並んでおり、正しい姿勢です。",
      "ロードシス型は 、骨盤が前傾し過ぎてしまい、反り腰になってしまっている状態です。",
      "スウェイバック型は 、頭が前に出て背中が丸まっている、いわゆる猫背の状態です。",
      "カイホロードシス型は 、背中は猫背丸くで、腰は反っている、いわゆる反り腰の状態です。",
      "フラットバック型は 、 背骨のS字カーブが全体的に弱くなっている姿勢です。"];
    List<String> bad_hugheight_list
    = ["抱っこの位置：",
      "かなり低いです",//34
      "やや低いです",//12
      "適切です",];//0
    List<String> bad_shoulderbalance_list
    = ["左右の肩の高さ：",
      "とても差があります",//34
      "やや差があります",//2
      "まあバランスがとれています",//1
      "バランスがとれています",];//0

    //ケンダル分類指摘出力
    if(summraize[1] == "ノーマル"){
      badpoint.add(bad_kendall_list[0]+bad_kendall_list[1]);
    }
    if(summraize[1] == "ロードシス"){
      badpoint.add(bad_kendall_list[0]+bad_kendall_list[2]);
    }
    if(summraize[1] == "スウェイバック"){
      badpoint.add(bad_kendall_list[0]+bad_kendall_list[3]);
    }
    if(summraize[1] == "カイホロードシス"){
      badpoint.add(bad_kendall_list[0]+bad_kendall_list[4]);
    }
    if(summraize[1] == "フラットバック"){
      badpoint.add(bad_kendall_list[0]+bad_kendall_list[5]);
    }
    //抱っこの高さ指摘出力
    if(point[5]==3||point[5]==4){
      badpoint.add(bad_hugheight_list[0]+bad_hugheight_list[1]);
    }
    if(point[5]==1||point[5]==2){
      badpoint.add(bad_hugheight_list[0]+bad_hugheight_list[2]);
    }
    if(point[5]==0){
      badpoint.add(bad_hugheight_list[0]+bad_hugheight_list[3]);
    }
    //肩のバランスの指摘出力
    if(point[7]==3||point[7]==4){
      badpoint.add(bad_shoulderbalance_list[0]+bad_shoulderbalance_list[1]);
    }
    if(point[7]==2){
      badpoint.add(bad_shoulderbalance_list[0]+bad_shoulderbalance_list[2]);
    }
    if(point[7]==1){
      badpoint.add(bad_shoulderbalance_list[0]+bad_shoulderbalance_list[3]);
    }
    if(point[7]==0){
      badpoint.add(bad_shoulderbalance_list[0]+bad_shoulderbalance_list[4]);
    }

    for(var i in badpoint){
      if(badcount==0) {
        badtext += badpoint[badcount];
        badcount++;
      }
      else {
        badtext += "\n" + badpoint[badcount];
        badcount++;
      }
    }

    print(badtext);

    return badtext;
  }
//アドバイスを返す
  String _advice(String advice){
    var summraize = _Summraize();
    var point = _triangular_chart();
    List<String> advicelist = [];
    String advice = "";
    int advicecount = 0;

    List<String> advice_kendall_list
    = ["横から見た姿勢：",
      "真横から見たとき耳たぶ・肩峰・股関節・膝・くるぶしの5点が床から一直線に並んでおり、正しい姿勢です。",
      "ロードシスを改善するために 、背中をまっすぐ伸ばし、腰椎の自然な湾曲を保つように心がけましょう。",
      "スウェイバックを改善するために 、背中をまっすぐ伸ばし、腰椎の自然な湾曲を保つように心がけましょう。",
      "カイホロードシスを改善するために 、背中をまっすぐ伸ばし、腰椎の自然な湾曲を保つように心がけましょう。",
      "フラットバックを改善するために 、腰の湾曲を意識し、腰を少し前に倒すイメージを持ちましょう。",
    ];
    List<String> advice_hugheight_list
    = ["抱っこの位置:",
      "かなり低いため赤ちゃんと大人のほっぺがつくような、キスができるような高さをこころがけましょう",
      "やや低いため赤ちゃんと大人のほっぺがつくような、キスができるような高さをこころがけましょう",
      "適切です",
    ];
    List<String> advice_shoulderbalance_list
    = ["左右の肩の高さ:",
      "とても差があるため背中をまっすぐ伸ばし、肩を軽く下げる姿勢を保つことが重要です。",
      "やや差があるため背中をまっすぐ伸ばし、肩を軽く下げる姿勢を保つことが重要です。",
      "まあ差があるため背中をまっすぐ伸ばし、肩を軽く下げる姿勢を保つことが重要です。",
      "バランスが取れています",
    ];

    //ケンダル分類指摘出力
    if(summraize[1] == "ノーマル"){
      advicelist.add(advice_kendall_list[0]+advice_kendall_list[1]);
    }
    if(summraize[1] == "ロードシス"){
      advicelist.add(advice_kendall_list[0]+advice_kendall_list[2]);
    }
    if(summraize[1] == "スウェイバック"){
      advicelist.add(advice_kendall_list[0]+advice_kendall_list[3]);
    }
    if(summraize[1] == "カイホロードシス"){
      advicelist.add(advice_kendall_list[0]+advice_kendall_list[4]);
    }
    if(summraize[1] == "フラットバック"){
      advicelist.add(advice_kendall_list[0]+advice_kendall_list[5]);
    }
    //抱っこの高さ指摘出力
    if(point[5]==3||point[5]==4){
      advicelist.add(advice_hugheight_list[0]+advice_hugheight_list[1]);
    }
    if(point[5]==1||point[5]==2){
      advicelist.add(advice_hugheight_list[0]+advice_hugheight_list[2]);
    }
    if(point[5]==0){
      advicelist.add(advice_hugheight_list[0]+advice_hugheight_list[3]);
    }
    //肩のバランスの指摘出力
    if(point[7]==3||point[7]==4){
      advicelist.add(advice_shoulderbalance_list[0]+advice_shoulderbalance_list[1]);
    }
    if(point[7]==2){
      advicelist.add(advice_shoulderbalance_list[0]+advice_shoulderbalance_list[2]);
    }
    if(point[7]==1){
      advicelist.add(advice_shoulderbalance_list[0]+advice_shoulderbalance_list[3]);
    }
    if(point[7]==0){
      advicelist.add(advice_shoulderbalance_list[0]+advice_shoulderbalance_list[4]);
    }

    //リストを一つ吐き出したら改行を行う
    for(var i in advicelist){
      if(advicecount==0) {
        advice += advicelist[advicecount];
        advicecount++;
      }
      else {
        advice += "\n" + advicelist[advicecount];
        advicecount++;
      }
    }
    print(advice);
    return advice;
  }

//三角チャート
List <double> _triangular_chart(){
  List<double> point=[];
  List<String> summraize = _Summraize();
  // double hug_height_score = 55;
  // double kendall_score1 = -140;
  // double kendall_score2 = 260;
  // double shoulder_score1 = 90;
  // double shoulder_score2 = 260;

  //満点三角形→path.moveTo(-80, -280);path.lineTo(-160, -140);path.lineTo(0, -140);
  double hug_height_score = -280;
  double kendall_score1 = -160;
  double kendall_score2 = -140;
  double shoulder_score1 = 0;
  double shoulder_score2 = -140;
  //5段階評価用
  double hug_height_point = 0;
  double kendall_point = 0;
  double shoulder_point = 0;

      //抱っこの高さ三角チャート計算
    if(double.parse(summraize[2]) > 0.5){
      hug_height_point = 0;
    }
    else if(double.parse(summraize[2]) > 0.45){
      hug_height_point = 1;
    }
    else if(double.parse(summraize[2]) > 0.40){
      hug_height_point = 2;
    }
    else if(double.parse(summraize[2]) > 0.35){
      hug_height_point = 3;
    }
    else{
      hug_height_point = 4;
    }
    
    //ケンダル三角チャート計算
    if(summraize[1]=="ノーマル"){
      kendall_point = 0;
    }
    else{
      kendall_point = 2;
    }

    //肩の並行三角チャート計算
    if(double.parse(summraize[0]) <= 2.8){
      shoulder_point = 0;
    }
    else if(double.parse(summraize[0]) <= 3.0){
      shoulder_point = 1;
    }
    else if(double.parse(summraize[0]) <= 3.2){
      shoulder_point = 2;
    }
    else if(double.parse(summraize[0]) <= 3.4){
      shoulder_point = 3;
    }
    else{
      shoulder_point = 4;
    }
    
    print(hug_height_point);
    print(kendall_point);
    print(shoulder_point);
    //満点三角形→path.moveTo(-25, 55);path.lineTo(-140, 260);path.lineTo(90, 260);
    //計算5段階評価の場合(5→1) hug_height_score +35していく kendall_score1　-28.75 kendallscore2 -16.25していく shoulder_score1 -28.75 shoulder_score2 -16.25していく
    //計算5段階評価の場合(5→1) hug_height_score +22.5していく kendall_score1　20.0 kendallscore2 -12.5していく shoulder_score1 -20 shoulder_score2 -12.5していく
    hug_height_score += hug_height_point * 22.5;
    kendall_score1 += kendall_point * 20;
    kendall_score2 += kendall_point * -12.5;
    shoulder_score1 += shoulder_point * -20;
    shoulder_score2 += shoulder_point * -12.5;

    //追加していく
    point.add(hug_height_score);
    point.add(kendall_score1);
    point.add(kendall_score2);
    point.add(shoulder_score1);
    point.add(shoulder_score2);
    point.add(hug_height_point);
    point.add(kendall_point);
    point.add(shoulder_point);


  return point;
}

//ダイアログ表示
_openDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero, //titleの周りについているpaddingを無しにする
          title : Visibility(
            child: Image.asset("assets/imagescore.png",height: 200,fit: BoxFit.cover,),visible: tf,
          ),
          content: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            Visibility(
              child: Text(kendall_text),visible: tf,)
            
            ],) ,
          actions: <Widget>[
            Visibility(child:
            CustomPaint(
              painter: ImagePainter(_triangular_chart()),
            ),visible: tf
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //初期状態
    if(count==0){
      image = widget.path1;
      offset = widget.offsets1;
      dir = "front";
      button = "score";
      count++;
      downcolor_1 = Colors.orange;
      upcolor_1 = Colors.orange;
      text = _score(score);
      summraize = _Summraize();
      kendall_text = "姿勢パターン:" + _kendall_classification()[0];
      
    }
    
    return Scaffold(
      appBar:  AppBar(centerTitle: true,
        actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home))],
        title:  Text("評価結果",style:TextStyle(color: Colors.black)),
      backgroundColor: Color.fromARGB(255, 174, 168, 167)),
      body:Stack(
          children: <Widget>[
            Column(
            //上のボタン
          children:[  Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          image = widget.path1;
                          offset = widget.offsets1;
                          dir = "front";
                          upcolor_1 = Colors.orange;
                          upcolor_2 = Colors.grey;
                          upcolor_3 = Colors.grey;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,60),
                        backgroundColor: upcolor_1,//ボタン背景色
                        elevation: 16,
                      ),
                      child: Text("正面",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          image = widget.path2;
                          offset = widget.offsets2;
                          dir = "right";
                          upcolor_1 = Colors.grey;
                          upcolor_2 = Colors.orange;
                          upcolor_3 = Colors.grey;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,60),
                        backgroundColor: upcolor_2,
                        elevation: 16,
                      ),
                      child: Text("右側面",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          image = widget.path3;
                          offset = widget.offsets3;
                          dir = "left";
                          upcolor_1 = Colors.grey;
                          upcolor_2 = Colors.grey;
                          upcolor_3 = Colors.orange;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,60),
                        backgroundColor: upcolor_3,
                        elevation: 16,
                      ),
                      child: Text("左側面",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
              ],
              ),],),
              Padding(padding: EdgeInsets.only(top:70),
                child: Image.file(
                  File(image)
                ),
              ),
              Padding(padding: EdgeInsets.only(top:70),
                child: CustomPaint(
                  //引数の渡す方
                  painter: MyPainter(offset,dir,button,summraize),
                  // タッチを有効にするため、childが必要
                  child: Center(),
              ),
              ),
              
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(alignment: Alignment.bottomCenter,
               child: Padding(padding: EdgeInsets.only(top: 10,left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          score = _score(score);
                          text = score;
                          button = "score";
                          imagescore = "assets/imagescore.png";
                          downcolor_1 = Colors.orange;
                          downcolor_2 = Colors.grey;
                          downcolor_3 = Colors.grey;
                          tf = true;
                          _openDialog();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: downcolor_1,//ボタン背景色
                        elevation: 16,
                      ),
                      child: Text(" 姿勢スコア",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                    ),
                    ),
                ),
                    Padding(padding: EdgeInsets.only(top: 10,left: 5),
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          summraize = _Summraize();
                          badpoint = _badpoint(badpoint);
                          text = badpoint;
                          button = "badpoint";
                          imagescore = "assets/null.png";
                          downcolor_1 = Colors.grey;
                          downcolor_2 = Colors.orange;
                          downcolor_3 = Colors.grey;
                          tf = false;
                          _openDialog();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: downcolor_2,
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
                          button = "advice";
                          imagescore = "assets/null.png";
                          downcolor_1 = Colors.grey;
                          downcolor_2 = Colors.grey;
                          downcolor_3 = Colors.orange;
                          tf = false;
                          _openDialog();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(120,80),
                        backgroundColor: downcolor_3,
                        elevation: 16,
                      ),
                      child: Text("アドバイス",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.white)),
                      
                    ),
                    ),
              ],
            ),
                    
            // Visibility(child: Text(kendall_text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black)),visible: tf,),
            // Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red)),
            // Visibility(child: CustomPaint(
            //   painter: ImagePainter(_triangular_chart()),
            // ),visible: tf)
            
            // Visibility(child: Image.asset(imagescore),visible: tf,)

      // Padding(padding: EdgeInsets.only(top: 730,left: 20),
      //     child: Text(_calculation(kendall),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black)),
      // ),
          ],
      ),
    );
    }
}

//描画用1
class MyPainter extends CustomPainter{
  //引数の受け取る方
  List<Offset> offsets;
  String dir;
  String button;
  List<String> summraize;

  MyPainter(this.offsets,this.dir,this.button,this.summraize);
  //appberの高さを取得
  // var height = AppBar().preferredSize.height;
  int count = 0;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;
    final radius = size.width / 50;
    List<Offset> landmarks = [];

    //テキストペインター用定義
    String text = "";
    TextSpan span = new TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.blue));

    //正面用
    if(dir=="front"){
    //修正ページのx,y座標と合わせる必要があるため -Offset(0,120) , countで制御
    if(count==0){
      count++;
      if(offsets.length==9){
        landmarks.add(offsets[0]-Offset(0, 120));
        landmarks.add(offsets[1]-Offset(0, 120));
        landmarks.add(offsets[2]-Offset(0, 120));
        landmarks.add(offsets[3]-Offset(0, 120));
        landmarks.add(offsets[4]-Offset(0, 120));
        landmarks.add(offsets[5]-Offset(0, 120));
        landmarks.add(offsets[6]-Offset(0, 120));
        landmarks.add(offsets[7]-Offset(0, 120));
        landmarks.add(offsets[8]-Offset(0, 120));
        //戻す
        offsets = landmarks;
      }
    }
    landmarks =  [];
    if(offsets.length!=9){
      landmarks.add(offsets[0]);
      landmarks.add(offsets[11]);
      landmarks.add(offsets[12]);
      landmarks.add(offsets[13]);
      landmarks.add(offsets[14]);
      landmarks.add(offsets[15]);
      landmarks.add(offsets[16]);
      landmarks.add(offsets[23]);
      landmarks.add(offsets[24]);

      //戻す
      offsets = landmarks;
    }

    final Nose = offsets[0];
    // final Left_eye = offsets[1];
    // final Right_eye = offsets[2];
    // final Left_mouth = offsets[3];
    // final Right_mouth = offsets[4];
    final Left_shoulder = offsets[1];
    final Right_shoulder = offsets[2];
    final Left_elbow = offsets[3];
    final Right_elbow = offsets[4];
    final Left_wrist = offsets[5];
    final Right_wrist = offsets[6];
    final Left_hip = offsets[7];
    final Right_hip = offsets[8];

    if(button=="advice") {
      //理想姿勢計算
      final Right_shoulder_ideal_x = Right_shoulder.dx - 1000;
      final Right_shoulder_ideal_y = (Left_shoulder.dy + Right_shoulder.dy) / 2;
      final Left_shoulder_ideal_x = Left_shoulder.dx + 1000;
      final Left_shoulder_ideal_y = (Left_shoulder.dy + Right_shoulder.dy) / 2;
      //理想姿勢線プロット
      paint.strokeWidth = 5;
      paint.color = Colors.red;
      canvas.drawLine(Offset(Right_shoulder_ideal_x, Right_shoulder_ideal_y),
          Offset(Left_shoulder_ideal_x, Left_shoulder_ideal_y), paint);
    }


    if(button=="score"||button=="advice") {
      //推定姿勢点プロット
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
      //canvas.drawCircle(Right_knee, radius, paint);
      //canvas.drawCircle(Right_ankle, radius, paint);
      // canvas.drawCircle(Left_eye, radius, paint);
      // canvas.drawCircle(Right_eye, radius, paint);
      // canvas.drawCircle(Left_mouth, radius, paint);
      // canvas.drawCircle(Right_mouth, radius, paint);
      //推定姿勢線プロット
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      // canvas.drawLine(Left_mouth, Right_mouth, paint);
      canvas.drawLine(Right_shoulder, Left_shoulder, paint);
      canvas.drawLine(Right_shoulder, Right_elbow, paint);
      canvas.drawLine(Left_shoulder, Left_elbow, paint);
      canvas.drawLine(Left_elbow, Left_wrist, paint);
      canvas.drawLine(Right_elbow, Right_wrist, paint);
      canvas.drawLine(Left_shoulder, Left_hip, paint);
      canvas.drawLine(Right_shoulder, Right_hip, paint);
      //canvas.drawLine(Right_knee, Right_hip, paint);
      //canvas.drawLine(Right_knee, Right_ankle, paint);
      canvas.drawLine(Right_hip, Left_hip, paint);
    }
    //正面でスコアボタンを押しているとき
      if(button=="score") {
        //shoulderbalance描画(肩のバランス：〇〇度)
        String shouldertext = "肩の角度は" + double.parse(summraize[0]).ceil().toString() + "度";
        TextSpan shoulderSpan = TextSpan(
          style: span.style,  // オリジナルのスタイルを維持
          text: shouldertext,  // 新しいテキストを指定
        );
        TextPainter shoulder = new TextPainter(text: shoulderSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
        shoulder.layout();
        shoulder.paint(canvas, new Offset(Left_shoulder.dx, (Right_shoulder.dy+Left_shoulder.dy)/2));

        //backhandの高さ(手首の高さ：〇〇％)
        String backwristtext = "手首の高さは" + ((double.parse(summraize[3])*100).ceil()).toString() + "%";
        TextSpan backwristSpan = TextSpan(
          style: span.style,  // オリジナルのスタイルを維持
          text: backwristtext,  // 新しいテキストを指定
        );
        TextPainter backwrist = new TextPainter(text: backwristSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
        backwrist.layout();
        backwrist.paint(canvas, new Offset(Left_wrist.dx, Left_wrist.dy));

        //backhandの高さ(手首の高さ：〇〇％)
        String hipwristtext = "手首の高さは" + ((double.parse(summraize[2])*100).ceil()).toString() + "%";
        TextSpan hipwristSpan = TextSpan(
          style: span.style,  // オリジナルのスタイルを維持
          text: hipwristtext,  // 新しいテキストを指定
        );
        TextPainter hipwrist = new TextPainter(text: hipwristSpan, textAlign: TextAlign.right, textDirection: TextDirection.ltr);
        hipwrist.layout();
        hipwrist.paint(canvas, new Offset(Right_wrist.dx, Right_wrist.dy));

      }
    //正面badpoint用
    // [1.9385906915861866, 不明, 0.3848952710315345, 0.8713518732334877, Right_wrist]
    // [肩の平行具合、ケンダル、ヒップハンド、バックハンド、イズヒップハンド]
    if(button=="badpoint"){
      //肩の平行具合に異常があるときpolotする
      if (double.parse(summraize[0]) > 2.8){
        paint.color = Colors.red.withOpacity(0.5);
        paint.strokeWidth = 5;
        canvas.drawCircle(Right_shoulder,25, paint);
        canvas.drawCircle(Left_shoulder,25, paint);
      }
      //抱っこの高さに異常があるときplotする
      if (double.parse(summraize[2]) < 0.5){
        if(summraize[4]=="Right_wrist"){
          paint.color = Colors.red.withOpacity(0.5);
          paint.strokeWidth = 5;
          canvas.drawCircle(Right_wrist, 25, paint);
        }
        else if(summraize[4]=="Left_wrist"){
          paint.color = Colors.red.withOpacity(0.5);
          paint.strokeWidth = 5;
          canvas.drawCircle(Left_wrist, 25, paint);
        }

      }

    }
  }

  //右用
  if(dir=="right"){
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

    if(button=="score"||button=="advice") {
      //姿勢推定
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Right_shoulder, radius, paint);
      canvas.drawCircle(Right_elbow, radius, paint);
      canvas.drawCircle(Right_wrist, radius, paint);
      canvas.drawCircle(Right_hip, radius, paint);
      canvas.drawCircle(Right_knee, radius, paint);
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
    }

    //右側姿勢スコアのボタンを押したときに描画する
    if(button=="score") {
      //膝角度
      String kneetext = "膝：" + double.parse(summraize[5]).ceil().toString() + "度";
      TextSpan kneeSpan = TextSpan(
        style: span.style,  // オリジナルのスタイルを維持
        text: kneetext,  // 新しいテキストを指定
      );
      TextPainter kneepaint = new TextPainter(text: kneeSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      kneepaint.layout();
      kneepaint.paint(canvas, new Offset(Right_knee.dx, Right_knee.dy));

      //腰角度
      String elbowtext = "腰：" + double.parse(summraize[6]).ceil().toString() + "度";
      TextSpan hipSpan = TextSpan(
        style: span.style,  // オリジナルのスタイルを維持
        text: elbowtext,  // 新しいテキストを指定
      );
      TextPainter elbowpaint = new TextPainter(text: hipSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      elbowpaint.layout();
      elbowpaint.paint(canvas, new Offset(Right_hip.dx, Right_hip.dy));

      //肩角度
      String shouldertext = "肩：" + double.parse(summraize[7]).ceil().toString() + "度";
      TextSpan shoulderSpan = TextSpan(
        style: span.style,  // オリジナルのスタイルを維持
        text: shouldertext,  // 新しいテキストを指定
      );
      TextPainter shoulderpaint = new TextPainter(text: shoulderSpan, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      shoulderpaint.layout();
      shoulderpaint.paint(canvas, new Offset(Right_shoulder.dx, Right_shoulder.dy));
    }


    //右面badpoint用
    if(button=="badpoint"){
      //肩の平行具合に異常があるときplotする
      if (double.parse(summraize[0]) > 2.8){
        paint.color = Colors.red.withOpacity(0.5);
        paint.strokeWidth = 5;
        canvas.drawCircle(Right_shoulder, 25, paint);
      }
      //抱っこの高さに異常があるときかつ右手がhiphadの時plotする
      if (double.parse(summraize[2]) < 0.5&&summraize[4]=="Right_wrist"){
        paint.color = Colors.red.withOpacity(0.5);
        paint.strokeWidth = 5;
        canvas.drawCircle(Right_wrist, 25, paint);
      }
    }
    //理想姿勢
    if(button=="advice") {
      //理想姿勢
      paint.color = Colors.red;
      canvas.drawCircle(
          Offset(Right_ankle_ideal_x, Right_shoulder_ideal), radius, paint);
      canvas.drawCircle(
          Offset(Right_ankle_ideal_x, Right_hip_ideal), radius, paint);
      canvas.drawCircle(
          Offset(Right_ankle_ideal_x, Right_knee_ideal), radius, paint);
      canvas.drawCircle(Right_ankle, radius, paint);

      paint.color = Colors.red;
      paint.strokeWidth = 5;
      canvas.drawLine(Offset(Right_ankle_ideal_x, Right_shoulder_ideal),
          Offset(Right_ankle_ideal_x, Right_hip_ideal), paint);
      canvas.drawLine(Offset(Right_ankle_ideal_x, Right_hip_ideal),
          Offset(Right_ankle_ideal_x, Right_knee_ideal), paint);
      canvas.drawLine(
          Offset(Right_ankle_ideal_x, Right_knee_ideal), Right_ankle, paint);
    }
  }

  //左用
  if(dir=="left"){
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
      landmarks.add(offsets[11]);
      landmarks.add(offsets[13]);
      landmarks.add(offsets[15]);
      landmarks.add(offsets[23]);
      landmarks.add(offsets[25]);
      landmarks.add(offsets[27]);

      //戻す
      offsets = landmarks;
    }

    final Nose = offsets[0];
    final Left_shoulder = offsets[1];
    final Left_elbow = offsets[2];
    final Left_wrist = offsets[3];
    final Left_hip = offsets[4];
    final Left_knee = offsets[5];
    final Left_ankle = offsets[6];

    final Left_shoulder_ideal = offsets[1].dy;
    final Left_hip_ideal = offsets[4].dy;
    final Left_knee_ideal = offsets[5].dy;
    final Left_ankle_ideal_x = offsets[6].dx;
    //左面badpoint用
    if(button=="score"||button=="advice") {
      //姿勢推定
      paint.color = Colors.orange;
      canvas.drawCircle(Nose, radius, paint);
      canvas.drawCircle(Left_shoulder, radius, paint);
      canvas.drawCircle(Left_elbow, radius, paint);
      canvas.drawCircle(Left_wrist, radius, paint);
      canvas.drawCircle(Left_hip, radius, paint);
      canvas.drawCircle(Left_knee, radius, paint);
      canvas.drawCircle(Left_ankle, radius, paint);

      //姿勢推定
      paint.strokeWidth = 5;
      paint.color = Colors.green;
      // canvas.drawLine(Nose, Left_shoulder, paint);
      canvas.drawLine(Left_shoulder, Left_elbow, paint);
      canvas.drawLine(Left_elbow, Left_wrist, paint);
      canvas.drawLine(Left_shoulder, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_hip, paint);
      canvas.drawLine(Left_knee, Left_ankle, paint);
    }
    //左面badpoint用
    if(button=="advice") {
      //理想姿勢
      paint.color = Colors.red;
      canvas.drawCircle(
          Offset(Left_ankle_ideal_x, Left_shoulder_ideal), radius, paint);
      canvas.drawCircle(
          Offset(Left_ankle_ideal_x, Left_hip_ideal), radius, paint);
      canvas.drawCircle(
          Offset(Left_ankle_ideal_x, Left_knee_ideal), radius, paint);
      canvas.drawCircle(Left_ankle, radius, paint);

      //理想姿勢
      paint.strokeWidth = 5;
      paint.color = Colors.red;
      canvas.drawLine(Offset(Left_ankle_ideal_x, Left_shoulder_ideal),
          Offset(Left_ankle_ideal_x, Left_hip_ideal), paint);
      canvas.drawLine(Offset(Left_ankle_ideal_x, Left_hip_ideal),
          Offset(Left_ankle_ideal_x, Left_knee_ideal), paint);
      canvas.drawLine(
          Offset(Left_ankle_ideal_x, Left_knee_ideal), Left_ankle, paint);
    }
    //左用badpoint用
    if(button=="badpoint"){
      //肩の平行具合に異常があるときpolotする
      if (double.parse(summraize[0]) > 2.8){
        paint.color = Colors.red.withOpacity(0.5);
        paint.strokeWidth = 5;
        canvas.drawCircle(Left_shoulder, 25, paint);
      }
      //抱っこの高さに異常があるときplotする
      if (double.parse(summraize[2]) < 0.5){
        if(summraize[4]=="Left_wrist"){
          paint.color = Colors.red.withOpacity(0.5);
          paint.strokeWidth = 5;
          canvas.drawCircle(Left_wrist, 25, paint);
        }

      }
    }
  }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

//描画用2
class ImagePainter extends CustomPainter{

  List<double> point;

  ImagePainter(this.point);

  @override
  void paint(Canvas canvas, Size size) {
    //チャート用
    // 三角（塗りつぶし）のためのPaintを作る
    Paint fillWithBluePaint = Paint()
      ..color = Colors.red.withOpacity(0.7);
    
    // 三角（外線）のためのPaintを作る
    Paint outlinePaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // Pathを作る
    var path = Path();
    
    double hug_height_score = point[0];
    double kendall_score1 = point[1];
    double kendall_score2 = point[2];
    double shoulder_score1 = point[3];
    double shoulder_score2 = point[4];

    // Pathのメソッドを使って三角形をかく。満点三角形→path.moveTo(-25, 60);path.lineTo(-140, 260);path.lineTo(90, 260);
    // Pathのメソッドを使って三角形をかく。満点三角形→path.moveTo(-80, -280);path.lineTo(-160, -140);path.lineTo(0, -140);
    //抱っこの高さ
    path.moveTo(-80, hug_height_score);
    // //背筋
    path.lineTo(kendall_score1, kendall_score2);
    // //肩の並行
    path.lineTo(shoulder_score1, shoulder_score2);
    
    // パスの座標と最初の座標を結ぶ。
    path.close();
    
    // 三角形（塗りつぶし）の描画
    canvas.drawPath(path, fillWithBluePaint);
    // 三角形（外線）の描画
    canvas.drawPath(path, outlinePaint);
  }
  

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}