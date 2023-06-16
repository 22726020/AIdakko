import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/inget.dart';
import 'package:gazou/manual.dart';
import 'package:quiver/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/improve.dart';
import 'package:gazou/test.dart';
import 'package:gazou/hand20.dart';
import 'package:gazou/developer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//日本語フォントに変更するため
//こんにちは
Future<void> main() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras[1];
  runApp(MyApp(camera: firstCamera));
}

Future<void> outcamera() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras[0];
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);
  final CameraDescription camera;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(camera:camera,title: '抱っこ支援アプリ'),
      //中華フォントからGoogleフォントに変更
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ja', 'JP'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _audio = AudioCache();
  //色の変更
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(centerTitle: true,title:  Text(widget.title,style:TextStyle(color: appbar_text_colors)),
        backgroundColor: appbar_colors),
        body:  Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/dakko3.jpg"),),
            Column(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(top: 32),
            //   child: Text('選択してください',style: TextStyle(fontSize: 30),),
            // ),
           
           SizedBox(height: 160,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ElevatedButton(
                //   onPressed: () {
                //   },
                //   style: ElevatedButton.styleFrom(
                //     primary: Color.fromARGB(255, 214, 204, 203),
                //     elevation: 26,
                //   ),
                //   child: Text('基本情報入力',style: TextStyle(fontSize: 20,color: Colors.black)),
                // ),
                // ElevatedButton(
                //   onPressed: _opneUrl,
                //   style: ElevatedButton.styleFrom(
                //     primary: Color.fromARGB(255, 214, 204, 203),
                //     elevation: 26,
                //   ),
                //   child: Text('アンケート入力',style: TextStyle(fontSize: 20,color: Colors.black)),
                // ),
                
              ],
            ),
            //隠しボタン
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 80),
              child: ElevatedButton(
                  onPressed: (){
                    _audio.play('akatyankoe.mp3');
                  },
                  style: ElevatedButton.styleFrom(
               primary: Colors.transparent,
                elevation: 0,
                  ),
                  child: Text('     ',style: TextStyle(fontSize: 50,color: main_text_colors)),
                ),
                ),
              ]
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 210,right: 10),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManualPage(title:widget.title,camera:widget.camera),
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    fixedSize:const Size(150,150),
                    backgroundColor: main_colors,
                    elevation: 16,
                  ),
                  child: Text('姿勢\n評価',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: main_text_colors)),
                ),
                ),
              //  ElevatedButton(
              //     onPressed: (){
              //       Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => Improve()
              // )
              //       );
              //     },
              //     style: ElevatedButton.styleFrom(fixedSize:const Size(100,100),
              //       primary: Color.fromARGB(255, 214, 160, 255),
              //       elevation: 16,
              //     ),
              //     child: Text('修正を行う',style: TextStyle(fontSize: 40,color: Colors.black)),
              //   ), 
              Padding(padding: EdgeInsets.only(top: 210,left: 10),
               child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandexpPage()
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    fixedSize:const Size(180,150),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    elevation: 16,
                  ),
                  child: Text('腱鞘炎\nチェック',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: main_text_colors),textAlign: TextAlign.center,),
                ),
                ),              
              ],
            ),
            // Align(alignment: Alignment.topRight,
            //     child: ElevatedButton(
            //       onPressed: (){
            //         outcamera();
            //         Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => Developer(title: '開発者',camera: widget.camera)
            //   )
            //         );
            //       },
            //       style: ElevatedButton.styleFrom(
            //         primary: Color.fromARGB(255, 214, 160, 255),
            //         elevation: 16,
            //       ),
            //       child: Text('開発者',style: TextStyle(fontSize: 20,color: main_text_colors)),
            //     ),
            // )
              ],
            ),
          ],
        ),
    );
  }
   void _opneUrl() async {
    final url = Uri.parse('https://docs.google.com/forms/d/168uxibsGbr7ciBM2FsLRksgxEMEkJ_TzCcePeq9n82s/edit?usp=sharing'); //←ここに表示させたいURLを入力する
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}
