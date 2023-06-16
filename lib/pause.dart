import 'package:camera/camera.dart';
import 'package:gazou/inget.dart';
import 'package:flutter/material.dart';

class Pause1Page extends StatefulWidget {
  const Pause1Page({Key? key, required this.title,required this.camera}) : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<Pause1Page> createState() => _Pause1PageState();
}

class _Pause1PageState extends State<Pause1Page> {
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
          title: new Text(widget.title,style:TextStyle(color: appbar_text_colors)),
        backgroundColor: appbar_colors),
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
                    backgroundColor: main_colors,
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: main_text_colors)),
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
          title: new Text(widget.title,style:TextStyle(color: appbar_text_colors)),
        backgroundColor: appbar_colors),
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
                    backgroundColor: main_colors,
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: main_text_colors)),
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
          title: Text(widget.title,style:TextStyle(color: appbar_text_colors)),
        backgroundColor: appbar_colors),
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
                    backgroundColor: main_colors,
                    elevation: 16,
                  ),
                  child: Text('再開する',style: TextStyle(fontSize: 50,color: main_text_colors)),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
