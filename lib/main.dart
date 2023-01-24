import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
import 'package:gazou/manual.dart';
import 'package:quiver/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/improve.dart';
import 'package:gazou/test.dart';
import 'package:gazou/hand.dart';
import 'package:gazou/hand20.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(centerTitle: true,title:  Text(widget.title,style:TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 174, 168, 167)),
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
                  child: Text('     ',style: TextStyle(fontSize: 50,color: Colors.black)),
                ),
                ),
              ]
              ),
              // Row(
              //   children: <Widget>[
              //     Padding(padding: EdgeInsets.only(top: 320,left: 34),
              //     child: ElevatedButton(
              //     onPressed: (){
              //       outcamera();
              //     }, child: Text('外カメラ',style: TextStyle(fontSize: 32,color: Colors.white)))),
              //     Padding(padding: EdgeInsets.only(top: 320,left: 15),
              //     child: ElevatedButton(
              //     onPressed: (){
              //       main();
              //     }, 
              //     child: Text('内カメラ',style: TextStyle(fontSize: 32,color: Colors.white)))),
              // ],
              // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 300),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManualPage(title:widget.title,camera:widget.camera),
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('撮影を行う',style: TextStyle(fontSize: 40,color: Colors.black)),
                ),
                ),
               ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Improve()
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('修正を行う',style: TextStyle(fontSize: 40,color: Colors.black)),
                ), 
               ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandexpPage()
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('腱鞘炎チェック',style: TextStyle(fontSize: 20,color: Colors.black)),
                ), 

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlazePage()
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('test',style: TextStyle(fontSize: 20,color: Colors.black)),
                ),              

              ],
            ),
          ],
        ),
            // ElevatedButton(
            //   onPressed: () { /* ボタンがタップされた時の処理 */ },
            //   child: Text('基本情報の登録',style:TextStyle(color: Colors.black)),
              
            //   )
          ],
        )
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
