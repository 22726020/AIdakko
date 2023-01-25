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
        appBar: AppBar(centerTitle: true,title: Text('説明',style:const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 174, 168, 167)),
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
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('チェックを開始する',style: TextStyle(fontSize: 20,color: Colors.black)),
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
        appBar: AppBar(centerTitle: true,title: Text('結果',style:const TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 174, 168, 167)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            //基準は13.0点
            Padding(padding: EdgeInsets.all(5),child:Text('あなたの点数は'+result1+'点です',style: TextStyle(fontSize: 30,color: Colors.black)),),
              
              (result<13)? Image.asset('assets/maru.png'): Image.asset('assets/batu.png'),
              (result<13)? const Text('腱鞘炎の可能性は低いです',style: TextStyle(fontSize: 28,color: Colors.black)):const Text('腱鞘炎の可能性が高いです\n医療機関で受診しましょう',style: TextStyle(fontSize: 28,color: Colors.red)),       

              Padding(padding: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 214, 160, 255),
                    elevation: 16,
                  ),
                  child: Text('終了する',style: TextStyle(fontSize: 20,color: Colors.black)),
                ),
              ), 
          ],
          ),
        ),
    );
  }
}
