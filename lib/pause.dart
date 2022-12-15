import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get1.dart';
import 'package:gazou/get2.dart';
import 'package:gazou/get3.dart';

class Pause1Page extends StatefulWidget {
  const Pause1Page({Key? key, required this.title,required this.camera}) : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<Pause1Page> createState() => _Pause1PageState();
}

class _Pause1PageState extends State<Pause1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: new Text(widget.title,style:TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 174, 168, 167)),
        body:  Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/pause.jpg"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const SizedBox(height: 700,),
                ElevatedButton(
                  onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TakePictureScreen1p1(camera: widget.camera),
                          ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
    );
  }
}


class Pause2Page extends StatefulWidget {
  const Pause2Page({Key? key, required this.title,required this.camera,required this.path1}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;


  @override
  State<Pause2Page> createState() => _Pause2PageState();
}

class _Pause2PageState extends State<Pause2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: new Text(widget.title,style:TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 174, 168, 167)),
        body:  Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/pause.jpg"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const SizedBox(height: 700,),
                ElevatedButton(
                  onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TakePictureScreen2p2(camera: widget.camera,path1: widget.path1,),
                          ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class Pause3Page extends StatefulWidget {
  const Pause3Page({Key? key, required this.title,required this.camera,required this.path1,required this.path2}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;
  final String path2;


  @override
  State<Pause3Page> createState() => _Pause3PageState();
}

class _Pause3PageState extends State<Pause3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: new Text(widget.title,style:TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 174, 168, 167)),
        body:  Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.asset("assets/pause.jpg"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const SizedBox(height: 700,),
                ElevatedButton(
                  onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TakePictureScreen3p3(camera: widget.camera,path1: widget.path1,path2: widget.path2),
                          ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
