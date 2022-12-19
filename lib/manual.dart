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
        appBar: AppBar(centerTitle: true,title: Text(widget.title,style:const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 174, 168, 167)),
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
