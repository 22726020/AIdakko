import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/junbi.dart';


class ManualPage extends StatefulWidget {
  const ManualPage({Key? key, required this.camera,required this.title}) : super(key: key);

  final String title;
  final CameraDescription camera;
  
  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  final _audio = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('環境説明',style:const TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/manual.png"),
            Text('どちらで行うか選択してください',style: TextStyle(fontSize: 22),),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => JunbiINPage(title: widget.title,camera:widget.camera),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 30,
          ),
          child: const Text('内カメ',style: TextStyle(fontSize: 40, color: Colors.white)),
          ),
      ElevatedButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => JunbiOUTPage(title: widget.title,camera:widget.camera),
          )
          );
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          elevation: 30,
          ),
          child: const Text('外カメ',style: TextStyle(fontSize: 40, color: Colors.white)),
          ),
          ],
    ),
          ],
          ),
        ),
    );
  }
}
