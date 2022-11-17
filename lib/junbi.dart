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
            Image.asset("assets/sumaho.jpg"),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => TakePictureScreen(camera:widget.camera),
          )
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
