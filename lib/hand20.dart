import 'package:flutter/material.dart';
import 'package:gazou/hand.dart';
import 'package:gazou/main.dart';

class HandexpPage extends StatefulWidget {
  const HandexpPage({Key? key, }) : super(key: key);
  
  @override
  State<HandexpPage> createState() => _HandexpPageState();
}

class _HandexpPageState extends State<HandexpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('説明',style:const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/handexp.png"),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandPage()
              )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 16,
                  ),
                  child: Text('チェックを開始する',style: TextStyle(fontSize: 20,color: Colors.white)),
                ), 
          ],
          ),
        ),
    );
  }
}

class HandresultPage extends StatefulWidget {
  const HandresultPage({Key? key, required this.result}) : super(key: key);
  final double result;
  @override
  State<HandresultPage> createState() => _HandresultPageState();
}

//Hand20結果
class _HandresultPageState extends State<HandresultPage> {
  @override
  Widget build(BuildContext context) {
    double result = widget.result;
    String result1 = result.toString();
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('結果',style:const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            //基準は13.0点
            Padding(padding: EdgeInsets.all(5),child:Text('あなたの点数は'+result1+'点です',style: TextStyle(fontSize: 30,color: Colors.black)),),
              
              (result<13)? Image.asset('assets/maru.png'): Image.asset('assets/batu.png'),
              (result<13)? const Text('腱鞘炎の可能性は低いです',style: TextStyle(fontSize: 28,color: Colors.black)):const Text('腱鞘炎の可能性が高いです\n医療機関で受診しましょう',style: TextStyle(fontSize: 28,color: Colors.red)),       

              (result<13)? 
              Padding(padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 16,
                  ),
                  child: Text('終了する',style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ):
              Padding(padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HandtehonPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 16,
                  ),
                  child: Text('アドバイス',style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ), 
          ],
          ),
        ),
    );
  }
}

class HandtehonPage extends StatefulWidget {
  const HandtehonPage({Key? key, }) : super(key: key);
  
  @override
  State<HandtehonPage> createState() => _HandtehonPageState();
}

class _HandtehonPageState extends State<HandtehonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,title: Text('アドバイス',style:const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const Padding(padding: EdgeInsets.all(10),
            child: Text('手首に負担をかけない縦抱きのやり方',style: TextStyle(fontSize: 22,backgroundColor: Colors.orange,color: Colors.black)),
            ),
            Image.asset("assets/tatetehon.png"),
            const Padding(padding: EdgeInsets.only(bottom: 10),
            child: Text('手首は返さず、肘から手首までを使って赤ちゃんのお尻部分を支えます。こうすれば手首への負担はなく、安定感も十分です。',style: TextStyle(fontSize: 20,color: Colors.black)),
            ),

            const Padding(padding: EdgeInsets.all(10),
            child: Text('手首に負担をかけない縦抱きのやり方',style: TextStyle(fontSize: 22,backgroundColor: Colors.orange,color: Colors.black)),
            ),
            Image.asset("assets/yokotehon.png"),
            const Padding(padding: EdgeInsets.only(bottom: 5),
            child: Text('手首を返さず、両手をつなげて抱っこをします。こうすれば安定感は十分ですし、手首にも負担がかかりません',style: TextStyle(fontSize: 20,color: Colors.black)),
            ),
              Padding(padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    elevation: 16,
                  ),
                  child: Text('終了する',style: TextStyle(fontSize: 20,color: Colors.white)),
                ),
              ), 
          ],
          ),
        ),
    );
  }
}