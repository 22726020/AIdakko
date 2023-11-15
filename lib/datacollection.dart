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
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:image/image.dart' as img;
import 'dart:convert';

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
      home:  DataCollection(camera:camera,title: '抱っこ支援アプリ'),
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

class DataCollection extends StatefulWidget {
  const DataCollection({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<DataCollection> createState() => _DataCollectionState();
}

class _DataCollectionState extends State<DataCollection> {
  final _audio = AudioCache();
  //色の変更
  var appbar_colors = Colors.white;
  var appbar_text_colors = Colors.black;
  var main_colors = Colors.black;
  var sub_colors = Colors.black;
  var main_text_colors = Colors.white;
  var sub_text_colors = Colors.white;
  var icon_colors = Colors.black;

  final TextEditingController idController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar:  AppBar(centerTitle: true,title:  Text(widget.title,style:TextStyle(color: appbar_text_colors)),
        // backgroundColor: appbar_colors),
        body:  Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset("assets/title.png"),),
            ),
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
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(top:40,left: 20),
                  child: TextFormField(
                    controller: idController,
                    decoration: InputDecoration(labelText: 'IDを入れるとID画像が生成されます'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'IDは任意です';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10,right: 10),
              child: ElevatedButton(
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                    // 1. IDを受け取る
                    String id = idController.text;

                    // 2. IDを画像化
                    Uint8List? imageBytes = textToImage(id);

                    if (imageBytes != null) {
                      // 3. 画像を保存
                      saveImage(imageBytes);
                    }
                  }

                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManualPage(title:widget.title,camera:widget.camera),
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    fixedSize:const Size(300,100),
                    backgroundColor: main_colors,
                    elevation: 16,
                  ),
                  child: Text('姿勢評価',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: main_text_colors)),
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
              // Padding(padding: EdgeInsets.only(top: 10,left: 10),
              //  child: ElevatedButton(
              //     onPressed: (){
              //       Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => HandexpPage()
              // )
              //       );
              // // _saveImageToGallery();
              //     },
              //     style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              //       fixedSize:const Size(180,150),
              //       backgroundColor: Colors.grey,
              //       elevation: 16,
              //     ),
              //     child: Text('腱鞘炎\nチェック',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: main_text_colors),textAlign: TextAlign.center,),
              //   ),
              //   ),              
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
    // SizedBox(
    //   width: 100, // 幅を調整
    //   height: 100, // 高さを調整
    //   child: RadarChart(
    //     RadarChartData(
    //       getTitle: ((index,angle) {
    //         if (index == 0){
    //           return RadarChartTitle(
    //                     text: '抱っこの高さ',
    //                     angle: 0
    //           );
    //         }
    //         if (index == 1){
    //           return RadarChartTitle(
    //                     text: '背筋',
    //                     angle: 0
    //           );
    //         }
    //         if (index == 2){
    //           return RadarChartTitle(
    //                     text: '手首の位置',
    //                     angle: 0
    //           );
    //         }
    //         if (index == 3){
    //           return RadarChartTitle(
    //                     text: 'Desktop',
    //                     angle: 0
    //           );
    //         }
    //         if (index == 4){
    //           return RadarChartTitle(
    //                     text: 'Desktop',
    //                     angle: 0
    //           );
    //         }
    //         else{
    //           return RadarChartTitle(
    //                     text: 'Desktop',
    //                     angle: 0
    //           );
    //         }
    //       }),
    //       dataSets: [
    //         RadarDataSet(
              
    //           fillColor: Colors.red.withOpacity(0.4),
    //           dataEntries: [
    //             //同じ数値に全部したら何故か(メモリ不足?)クラッシュする
    //             RadarEntry(value: 10),
    //             RadarEntry(value: 10),
    //             RadarEntry(value: 10),
    //             RadarEntry(value: 10),
    //             RadarEntry(value: 10-0.01),
    //           ],
              
    //         ),
    //       ],
          
    //       // 他のチャートプロパティを設定
          
    //     ),
    //   ),
    // ),
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

//   Future<void> _Imagesave() async {
//   // 1. アプリ内の画像ファイルをアセットからコピーして保存
//   final appDocDir = await getApplicationDocumentsDirectory();
//   final imageFile = File('${appDocDir.path}/white.png');
  
//   // 2. アセットから画像ファイルをコピー
//   final ByteData data = await rootBundle.load('assets/white.png');
//   final List<int> bytes = data.buffer.asUint8List();
//   await imageFile.writeAsBytes(bytes);

//   // 3. 保存したファイルをギャラリーアルバムに保存
//   final result = await ImageGallerySaver.saveFile(imageFile.path);
  
//     if (result != null) {
//       print('画像がギャラリーアルバムに保存されました: $result');
//     } else {
//       print('画像の保存に失敗しました');
//     }
//   }
  Uint8List? textToImage(String text) {
    final img.Image image = img.Image(200, 200); // 画像サイズを設定

    // 画像にテキストを描画
    img.fill(image, img.getColor(255, 255, 255)); // 背景を白に設定
    img.drawString(image, img.arial_24, 10, 80, text, color: img.getColor(0, 0, 0));

    return Uint8List.fromList(img.encodePng(image));
  }

void saveImage(Uint8List imageBytes) async {
  final result = await ImageGallerySaver.saveImage(imageBytes);
  if (result != null) {
    print('画像がギャラリーアルバムに保存されました: $result');
  } else {
    print('画像の保存に失敗しました');
  }
}
}

    // SizedBox(
    //   width: 100, // 幅を調整
    //   height: 100, // 高さを調整
    //   child: RadarChart(
    //     RadarChartData(
    //       dataSets: [
    //         RadarDataSet(
    //           fillColor: Colors.amber,
    //           dataEntries: [
    //             RadarEntry(value: 5),
    //             RadarEntry(value: 5),
    //             RadarEntry(value: 5),
    //             RadarEntry(value: 5),
    //             RadarEntry(value: 5),
    //           ],
    //         ),
    //       ],
    //       // 他のチャートプロパティを設定
    //     ),
    //   ),
    // ),
    
