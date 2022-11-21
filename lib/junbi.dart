import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
import 'package:audioplayers/audioplayers.dart';


class JunbiPage extends StatefulWidget {
  const JunbiPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<JunbiPage> createState() => _JunbiPageState();
}

class _JunbiPageState extends State<JunbiPage> {
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
            title: Text("スマホを置きましたか？"),
            content: Text("なるべく垂直に置き、\n全身が写るようにして下さい.\n10秒後に撮影されます"),
            actions: [
              GestureDetector(
                child: Text("はい",style: TextStyle(fontSize: 30),),
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
                  )
          );
                },
              )
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
