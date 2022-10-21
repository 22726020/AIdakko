import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SavePage extends StatefulWidget {
  const SavePage({Key? key, required this.camera,required this.title,required this.path1, required this.path2, required this.path3}) : super(key: key);

  final String title;
  final CameraDescription camera;
  final String path1;
  final String path2;
  final String path3;

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('確認画面')),
    body: SingleChildScrollView(
      child:Column(
      children: <Widget>[
      Image.file(File(widget.path1)),
      Image.file(File(widget.path2)),
      Image.file(File(widget.path3)),
      ],
      ),
    ),
  );
  }
}