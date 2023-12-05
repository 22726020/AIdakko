import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/inget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/junbi.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:gazou/main.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
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
    //デバイスのサイズを取得する
    // DeviceSizeHelperクラスのインスタンスを作成
    DeviceSizeHelper deviceSizeHelper = DeviceSizeHelper(context);
    // 外部クラスのメソッドを呼び出してデバイスサイズを取得
    List<double> size = deviceSizeHelper.getDeviceSize();
    double deviceWidth = size[0];
    double deviceHeight = size[1];

    return Scaffold(
        appBar: AppBar(centerTitle: true,
          actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
          title: Text('撮影を行う前に',style:TextStyle(color: appbar_text_colors )),
        backgroundColor: appbar_colors),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[

            Image.asset("assets/manual.png"),
            Text('どちらで行うか選択してください',style: TextStyle(fontSize: 22),),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      Padding(padding: EdgeInsets.only(top: 20),
      child:
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => JunbiINPage(title: widget.title,camera:widget.camera),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: main_colors,
          elevation: 30,
          ),
                child: Text('自撮り\nモード',style: TextStyle(fontSize: 30, color: main_text_colors)),
          ),
      ),
      Padding(padding: EdgeInsets.only(top: 20),
      child:
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => JunbiOUTPage(title: widget.title,camera:widget.camera),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          elevation: 30,
          ),
                child: Text('他撮り\nモード',style: TextStyle(fontSize: 30, color: main_text_colors)),
          ),
      ),
          ],
    ),
          ],
          ),
        ),
    );
  }
}

  Future<void> _InImagesave() async {
  // 1. アプリ内の画像ファイルをアセットからコピーして保存
  final appDocDir = await getApplicationDocumentsDirectory();
  final imageFile = File('${appDocDir.path}/jidori.png');
  
  // 2. アセットから画像ファイルをコピー
  final ByteData data = await rootBundle.load('assets/jidori.png');
  final List<int> bytes = data.buffer.asUint8List();
  await imageFile.writeAsBytes(bytes);

  // 3. 保存したファイルをギャラリーアルバムに保存
  final result = await ImageGallerySaver.saveFile(imageFile.path);
  
    if (result != null) {
      print('画像がギャラリーアルバムに保存されました: $result');
    } else {
      print('画像の保存に失敗しました');
    }
  }
  Future<void> _OutImagesave() async {
  // 1. アプリ内の画像ファイルをアセットからコピーして保存
  final appDocDir = await getApplicationDocumentsDirectory();
  final imageFile = File('${appDocDir.path}/tadori.png');
  
  // 2. アセットから画像ファイルをコピー
  final ByteData data = await rootBundle.load('assets/tadori.png');
  final List<int> bytes = data.buffer.asUint8List();
  await imageFile.writeAsBytes(bytes);

  // 3. 保存したファイルをギャラリーアルバムに保存
  final result = await ImageGallerySaver.saveFile(imageFile.path);
  
    if (result != null) {
      print('画像がギャラリーアルバムに保存されました: $result');
    } else {
      print('画像の保存に失敗しました');
    }
  }