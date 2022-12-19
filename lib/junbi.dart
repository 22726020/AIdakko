import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text(widget.title,style:const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 174, 168, 167)),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/manual2.png"),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: ()async{
showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("準備はできましたか？"),
            content: const Text("スマホはなるべく垂直に置き\n全身が写るようにして下さい\n十分離れた後に\nお子さんを抱っこして下さい\n撮影が開始されます"),
            actions: [
              GestureDetector(
                child: Text("いいえ",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Text("はい",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
                  )
          );
                },
              ),
            ],
          ),
        );
          },
        style: ElevatedButton.styleFrom(
          elevation: 30,
          ),
          child: const Text('次へ',style: TextStyle(fontSize: 40, color: Colors.white)),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text(widget.title,style:const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 174, 168, 167)),
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
                child: Text("いいえ",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              GestureDetector(
                child: Text("はい",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => OutTakePicture1(camera:firstCamera),
                  )
          );
                },
              ),
            ],
          ),
        );
          },
        style: ElevatedButton.styleFrom(
          elevation: 30,
          ),
          child: const Text('次へ',style: TextStyle(fontSize: 40, color: Colors.white)),
          ),
          ],
    ),
          ],
          ),
        ),
    );
  }
}