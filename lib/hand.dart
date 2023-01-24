import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gazou/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gazou/junbi.dart';


class HandPage extends StatefulWidget {
  const HandPage({Key? key, }) : super(key: key);
  
  @override
  State<HandPage> createState() => _HandPageState();
}

enum Fruits { Apple, Orange, Grape }

class _HandPageState extends State<HandPage> {
  var _radVal = Fruits.Apple;

  void _onChanged(value) {
    setState(() {
      _radVal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('腱鞘炎テスト'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
        Image.asset("assets/hand1.png"),
        Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RadioListTile(
                title: Text('Orange'),
                value: Fruits.Orange,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Apple'),
                value: Fruits.Apple,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Grape'),
                value: Fruits.Grape,
                groupValue: _radVal,
                onChanged: _onChanged),
          ],
        ),
        ),
                Image.asset("assets/hand1.png"),
        Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RadioListTile(
                title: Text('Orange'),
                value: Fruits.Orange,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Apple'),
                value: Fruits.Apple,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Grape'),
                value: Fruits.Grape,
                groupValue: _radVal,
                onChanged: _onChanged),
          ],
        ),
        ),
                Image.asset("assets/hand1.png"),
        Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RadioListTile(
                title: Text('Orange'),
                value: Fruits.Orange,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Apple'),
                value: Fruits.Apple,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Grape'),
                value: Fruits.Grape,
                groupValue: _radVal,
                onChanged: _onChanged),
          ],
        ),
        ),
        ],
        
        ),
      ),
    );
  }
}
