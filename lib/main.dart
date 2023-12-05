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
import 'package:gazou/datacollection.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//こんにちは
Future<void> main() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras[1];
  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

//firebase
// Future<void> uploadImage(File imageFile) async {
//   try {
//     // アセットから画像ファイルを取得
//     ByteData data = await rootBundle.load('assets/title.png');
//     Uint8List imageData = data.buffer.asUint8List();

//     Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//     UploadTask uploadTask = storageReference.putData(imageData);

//     await uploadTask.whenComplete(() => print('画像のアップロードが完了しました'));

//     String imageUrl = await storageReference.getDownloadURL();
//     print('画像のURL: $imageUrl');
//   } catch (e) {
//     print('エラー: $e');
//   }
// }

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

  final TextEditingController idController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //デバイスのサイズを取得する
    // DeviceSizeHelperクラスのインスタンスを作成
    DeviceSizeHelper deviceSizeHelper = DeviceSizeHelper(context);
    // 外部クラスのメソッドを呼び出してデバイスサイズを取得
    List<double> size = deviceSizeHelper.getDeviceSize();
    double deviceWidth = size[0];
    double deviceHeight = size[1];

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
                    // _audio.play('akatyankoe.mp3');
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
              // Form(
              //   key: formKey,
              //   child: Padding(
              //     padding: EdgeInsets.only(top:280,left: 20),
              //     child: TextFormField(
              //       controller: idController,
              //       decoration: InputDecoration(labelText: 'IDを入れるとID画像が生成されます'),
              //       validator: (value) {
              //         if (value == null || value.isEmpty) {
              //           return 'IDは任意です';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 300,right: 10),
              child: ElevatedButton(
                  onPressed: (){
                    //firebase
                    // uploadImage(File("assets/title.png"));

                  //   if (formKey.currentState!.validate()) {
                  //   // 1. IDを受け取る
                  //   String id = idController.text;

                  //   // 2. IDを画像化
                  //   Uint8List? imageBytes = textToImage(id);

                  //   if (imageBytes != null) {
                  //     // 3. 画像を保存
                  //     saveImage(imageBytes);
                  //   }
                  // }

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
              Padding(padding: EdgeInsets.only(top: 300,left: 10),
               child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataCollection(camera: widget.camera, title: widget.title)
              )
                    );
              // _saveImageToGallery();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    fixedSize:const Size(180,150),
                    backgroundColor: Colors.grey,
                    elevation: 16,
                  ),
                  child: Text('データ\n収集',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: main_text_colors),textAlign: TextAlign.center,),
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

//デバイスのサイズを取得するクラス
class DeviceSizeHelper {
  BuildContext context;

  // コンストラクタ
  DeviceSizeHelper(this.context);

  // デバイスのサイズを取得するメソッド
  List<double> getDeviceSize() {
    List<double> devicesize = [];

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    devicesize.add(deviceWidth);
    devicesize.add(deviceHeight);

    return devicesize;
  }
}
    
