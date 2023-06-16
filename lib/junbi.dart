import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/inget.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/outget.dart';

class JunbiINPage extends StatefulWidget {
  const JunbiINPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<JunbiINPage> createState() => _JunbiINPageState();
}

class _JunbiINPageState extends State<JunbiINPage> {
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
        appBar: AppBar(centerTitle: true,
          actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
          title: Text('内カメラ',style:TextStyle(color: appbar_text_colors)),
        backgroundColor: appbar_colors),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/manual2.png"),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: ()async{
            final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
            final firstCamera = cameras[1];
            showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("準備はできましたか？"),
            content: const Text("スマホはなるべく垂直に置き\n全身が写るようにして下さい\n十分離れた後に\nお子さんを抱っこして下さい\n撮影が開始されます"),
            actions: [
              GestureDetector(
                child: Text("はい",style: TextStyle(fontSize: 30)),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
                      )
                  );
                },
              ),
              GestureDetector(
                child: Text("いいえ",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: main_colors,
          elevation: 30,
          ),
          child: Text('次へ',style: TextStyle(fontSize: 40, color: main_text_colors)),
          ),
          ],
    ),
          ],
          ),
        ),
    );
  }
}

class JunbiOUTPage extends StatefulWidget {
  const JunbiOUTPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<JunbiOUTPage> createState() => _JunbiOUTPageState();
}

class _JunbiOUTPageState extends State<JunbiOUTPage> {
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
        appBar: AppBar(centerTitle: true,
          actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home,color: icon_colors,))],
          title: Text('外カメラ',style:TextStyle(color:appbar_text_colors)),
        backgroundColor: appbar_colors),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/junbiout.png"),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: ()async{
            final cameras = await availableCameras();
  // 利用可能なカメラのリストから特定のカメラを取得
            final firstCamera = cameras[0];
showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("準備はできましたか？"),
            content: const Text("全身が写る距離まで離れて下さい\n撮影が開始されます"),
            actions: [
              GestureDetector(
                child: Text("はい",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OutTakePicture1(camera:firstCamera),
                      )
                  );
                },
              ),
              GestureDetector(
                child: Text("いいえ",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: main_colors,
          elevation: 30,
          ),
          child:Text('次へ',style: TextStyle(fontSize: 40, color: main_text_colors)),
          ),
          ],
    ),
          ],
          ),
        ),
    );
  }
}