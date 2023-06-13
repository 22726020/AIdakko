import 'package:flutter/material.dart';


class Improve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '座標改善ページ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PointerDrawingWidget(title:'座標改善ページ'),
    );
  }
}

class PointerDrawingWidget extends StatefulWidget {
  PointerDrawingWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PointerDrawingWidgetState createState() => _PointerDrawingWidgetState();
}

class _PointerDrawingWidgetState extends State<PointerDrawingWidget> {
  final _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[IconButton(onPressed: (){Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);}, icon:Icon(Icons.home))],
        title: Text(widget.title),
      ),
      body:Stack(
        children: <Widget>[  
          Image.asset('assets/pause.jpg'),
          GestureDetector(
          // child: Image.asset('dakko.jpg'),
          // TapDownイベントを検知
          onTapDown: _addPoint,
          // カスタムペイント
          child: CustomPaint(
            painter: MyPainter(_points),
            // タッチを有効にするため、childが必要
            child: Center(),
        ),
      ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        // 点のクリアボタン
        onPressed: _clearPoints,
        tooltip: 'Clear',
        child: Icon(Icons.clear),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // タッチした点をクリアする
  void _clearPoints(){
    setState((){
      _points.clear();
    });
  }

  // 点を追加
  void _addPoint(TapDownDetails details) {
    // setState()にリストを更新する関数を渡して状態を更新
    setState(() {
      _points.add(details.localPosition);
    });
  }
}

class MyPainter extends CustomPainter{
  final List<Offset> _points;
  final _rectPaint = Paint()..color = Colors.blue;

  MyPainter(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    // 記憶している点を描画する
    _points.forEach((offset) =>
        // canvas.drawRect(Rect.fromCenter(center: offset, width: 20.0, height: 20.0), _rectPaint));
        canvas.drawCircle(offset, 10, _rectPaint)); 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
