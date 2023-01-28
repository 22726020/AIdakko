import 'package:flutter/material.dart';
import 'package:gazou/Hand20.dart';



class HandPage extends StatefulWidget {
  const HandPage({Key? key, }) : super(key: key);
  
  @override
  State<HandPage> createState() => _HandPageState();
}

enum score { zero, one, two, three, four, five, six, seven, eight, nine, ten}

class _HandPageState extends State<HandPage> {
  var _score1 = score.zero;
  var _score2 = score.zero;
  var _score3 = score.zero;
  var _score4 = score.zero;
  var _score5 = score.zero;
  var _score6 = score.zero;
  var _score7 = score.zero;
  var _score8 = score.zero;
  var _score9 = score.zero;
  var _score10 = score.zero;
  var _score11 = score.zero;
  var _score12 = score.zero;
  var _score13 = score.zero;
  var _score14 = score.zero;
  var _score15 = score.zero;
  var _score16 = score.zero;
  var _score17 = score.zero;
  var _score18 = score.zero;
  var _score19 = score.zero;
  var _score20 = score.zero;

  void _onChanged(value) {
    setState(() {
      _score1 = value;
    });
  }
  void _onChanged2(value) {
    setState(() {
      _score2 = value;
    });
  }
  void _onChanged3(value) {
    setState(() {
      _score3 = value;
    });
  }
  void _onChanged4(value) {
    setState(() {
      _score4 = value;
    });
  }
  void _onChanged5(value) {
    setState(() {
      _score5 = value;
    });
  }
  void _onChanged6(value) {
    setState(() {
      _score6 = value;
    });
  }
  void _onChanged7(value) {
    setState(() {
      _score7 = value;
    });
  }
  void _onChanged8(value) {
    setState(() {
      _score8 = value;
    });
  }
  void _onChanged9(value) {
    setState(() {
      _score9 = value;
    });
  }
  void _onChanged10(value) {
    setState(() {
      _score10 = value;
    });
  }
  void _onChanged11(value) {
    setState(() {
      _score11 = value;
    });
  }
  void _onChanged12(value) {
    setState(() {
      _score12 = value;
    });
  }
  void _onChanged13(value) {
    setState(() {
      _score13 = value;
    });
  }
  void _onChanged14(value) {
    setState(() {
      _score14 = value;
    });
  }
  void _onChanged15(value) {
    setState(() {
      _score15 = value;
    });
  }
  void _onChanged16(value) {
    setState(() {
      _score16 = value;
    });
  }
  void _onChanged17(value) {
    setState(() {
      _score17 = value;
    });
  }
  void _onChanged18(value) {
    setState(() {
      _score18 = value;
    });
  }
  void _onChanged19(value) {
    setState(() {
      _score19 = value;
    });
  }
  void _onChanged20(value) {
    setState(() {
      _score20 = value;
    });
  }
  void _result(){
    double result1 = 0;
    double result2 = 0;
    double result3 = 0;
    double result4 = 0;
    double result5 = 0;
    double result6 = 0;
    double result7 = 0;
    double result8 = 0;
    double result9 = 0;
    double result10 = 0;
    double result11 = 0;
    double result12 = 0;
    double result13 = 0;
    double result14 = 0;
    double result15 = 0;
    double result16 = 0;
    double result17 = 0;
    double result18 = 0;
    double result19 = 0;
    double result20 = 0;
    double finalresult = 0;
    switch(_score1){
      case score.zero:
      result1 = 0;
      break;
      case score.one:
      result1 = 1;   
      break;
      case score.two:
      result1 = 2;   
      break;
      case score.three:
      result1 = 3;   
      break;
      case score.four:
      result1 = 4;   
      break;
      case score.five:
      result1 = 5;   
      break;
      case score.six:
      result1 = 6;   
      break;
      case score.seven:
      result1 = 7;   
      break;
      case score.eight:
      result1 = 8;   
      break;
      case score.nine:
      result1 = 9;   
      break;
      case score.ten:
      result1 = 10;   
      break;      
    }
      switch(_score2){
      case score.zero:
      result2 = 0;
      break;
      case score.one:
      result2 = 1;   
      break;
      case score.two:
      result2 = 2;   
      break;
      case score.three:
      result2 = 3;   
      break;
      case score.four:
      result2 = 4;   
      break;
      case score.five:
      result2 = 5;   
      break;
      case score.six:
      result2 = 6;   
      break;
      case score.seven:
      result2 = 7;   
      break;
      case score.eight:
      result2 = 8;   
      break;
      case score.nine:
      result2 = 9;   
      break;
      case score.ten:
      result2 = 10;   
      break;      
    }
      switch(_score3){
      case score.zero:
      result3 = 0;
      break;
      case score.one:
      result3 = 1;   
      break;
      case score.two:
      result3 = 2;   
      break;
      case score.three:
      result3 = 3;   
      break;
      case score.four:
      result3 = 4;   
      break;
      case score.five:
      result3 = 5;   
      break;
      case score.six:
      result3 = 6;   
      break;
      case score.seven:
      result3 = 7;   
      break;
      case score.eight:
      result3 = 8;   
      break;
      case score.nine:
      result3 = 9;   
      break;
      case score.ten:
      result3 = 10;   
      break;      
    }
      switch(_score4){
      case score.zero:
      result4 = 0;
      break;
      case score.one:
      result4 = 1;   
      break;
      case score.two:
      result4 = 2;   
      break;
      case score.three:
      result4 = 3;   
      break;
      case score.four:
      result4 = 4;   
      break;
      case score.five:
      result4 = 5;   
      break;
      case score.six:
      result4 = 6;   
      break;
      case score.seven:
      result4 = 7;   
      break;
      case score.eight:
      result4 = 8;   
      break;
      case score.nine:
      result4 = 9;   
      break;
      case score.ten:
      result4 = 10;   
      break;      
    }
      switch(_score5){
      case score.zero:
      result5 = 0;
      break;
      case score.one:
      result5 = 1;   
      break;
      case score.two:
      result5 = 2;   
      break;
      case score.three:
      result5 = 3;   
      break;
      case score.four:
      result5 = 4;   
      break;
      case score.five:
      result5 = 5;   
      break;
      case score.six:
      result5 = 6;   
      break;
      case score.seven:
      result5 = 7;   
      break;
      case score.eight:
      result5 = 8;   
      break;
      case score.nine:
      result5 = 9;   
      break;
      case score.ten:
      result5 = 10;   
      break;      
    }
      switch(_score6){
      case score.zero:
      result6 = 0;
      break;
      case score.one:
      result6 = 1;   
      break;
      case score.two:
      result6 = 2;   
      break;
      case score.three:
      result6 = 3;   
      break;
      case score.four:
      result6 = 4;   
      break;
      case score.five:
      result6 = 5;   
      break;
      case score.six:
      result6 = 6;   
      break;
      case score.seven:
      result6 = 7;   
      break;
      case score.eight:
      result6 = 8;   
      break;
      case score.nine:
      result6 = 9;   
      break;
      case score.ten:
      result6 = 10;   
      break;      
    }
      switch(_score7){
      case score.zero:
      result7 = 0;
      break;
      case score.one:
      result7 = 1;   
      break;
      case score.two:
      result7 = 2;   
      break;
      case score.three:
      result7 = 3;   
      break;
      case score.four:
      result7 = 4;   
      break;
      case score.five:
      result7 = 5;   
      break;
      case score.six:
      result7 = 6;   
      break;
      case score.seven:
      result7 = 7;   
      break;
      case score.eight:
      result7 = 8;   
      break;
      case score.nine:
      result7 = 9;   
      break;
      case score.ten:
      result7 = 10;   
      break;      
    }
      switch(_score8){
      case score.zero:
      result8 = 0;
      break;
      case score.one:
      result8 = 1;   
      break;
      case score.two:
      result8 = 2;   
      break;
      case score.three:
      result8 = 3;   
      break;
      case score.four:
      result8 = 4;   
      break;
      case score.five:
      result8 = 5;   
      break;
      case score.six:
      result8 = 6;   
      break;
      case score.seven:
      result8 = 7;   
      break;
      case score.eight:
      result8 = 8;   
      break;
      case score.nine:
      result8 = 9;   
      break;
      case score.ten:
      result8 = 10;   
      break;      
    }
      switch(_score9){
      case score.zero:
      result9 = 0;
      break;
      case score.one:
      result9 = 1;   
      break;
      case score.two:
      result9 = 2;   
      break;
      case score.three:
      result9 = 3;   
      break;
      case score.four:
      result9 = 4;   
      break;
      case score.five:
      result9 = 5;   
      break;
      case score.six:
      result9 = 6;   
      break;
      case score.seven:
      result9 = 7;   
      break;
      case score.eight:
      result9 = 8;   
      break;
      case score.nine:
      result9 = 9;   
      break;
      case score.ten:
      result9 = 10;   
      break;      
    }
      switch(_score10){
      case score.zero:
      result10 = 0;
      break;
      case score.one:
      result10 = 1;   
      break;
      case score.two:
      result10 = 2;   
      break;
      case score.three:
      result10 = 3;   
      break;
      case score.four:
      result10 = 4;   
      break;
      case score.five:
      result10 = 5;   
      break;
      case score.six:
      result10 = 6;   
      break;
      case score.seven:
      result10 = 7;   
      break;
      case score.eight:
      result10 = 8;   
      break;
      case score.nine:
      result10 = 9;   
      break;
      case score.ten:
      result10 = 10;   
      break;      
    }
      switch(_score11){
      case score.zero:
      result11 = 0;
      break;
      case score.one:
      result11 = 1;   
      break;
      case score.two:
      result11 = 2;   
      break;
      case score.three:
      result11 = 3;   
      break;
      case score.four:
      result11 = 4;   
      break;
      case score.five:
      result11 = 5;   
      break;
      case score.six:
      result11 = 6;   
      break;
      case score.seven:
      result11 = 7;   
      break;
      case score.eight:
      result11 = 8;   
      break;
      case score.nine:
      result11 = 9;   
      break;
      case score.ten:
      result11 = 10;   
      break;      
    }
      switch(_score12){
      case score.zero:
      result12 = 0;
      break;
      case score.one:
      result12 = 1;   
      break;
      case score.two:
      result12 = 2;   
      break;
      case score.three:
      result12 = 3;   
      break;
      case score.four:
      result12 = 4;   
      break;
      case score.five:
      result12 = 5;   
      break;
      case score.six:
      result12 = 6;   
      break;
      case score.seven:
      result12 = 7;   
      break;
      case score.eight:
      result12 = 8;   
      break;
      case score.nine:
      result12 = 9;   
      break;
      case score.ten:
      result12 = 10;   
      break;      
    }
      switch(_score13){
      case score.zero:
      result13 = 0;
      break;
      case score.one:
      result13 = 1;   
      break;
      case score.two:
      result13 = 2;   
      break;
      case score.three:
      result13 = 3;   
      break;
      case score.four:
      result13 = 4;   
      break;
      case score.five:
      result13 = 5;   
      break;
      case score.six:
      result13 = 6;   
      break;
      case score.seven:
      result13 = 7;   
      break;
      case score.eight:
      result13 = 8;   
      break;
      case score.nine:
      result13 = 9;   
      break;
      case score.ten:
      result13 = 10;   
      break;      
    }
      switch(_score14){
      case score.zero:
      result14 = 0;
      break;
      case score.one:
      result14 = 1;   
      break;
      case score.two:
      result14 = 2;   
      break;
      case score.three:
      result14 = 3;   
      break;
      case score.four:
      result14 = 4;   
      break;
      case score.five:
      result14 = 5;   
      break;
      case score.six:
      result14 = 6;   
      break;
      case score.seven:
      result14 = 7;   
      break;
      case score.eight:
      result14 = 8;   
      break;
      case score.nine:
      result14 = 9;   
      break;
      case score.ten:
      result14 = 10;   
      break;      
    }
      switch(_score15){
      case score.zero:
      result15 = 0;
      break;
      case score.one:
      result15 = 1;   
      break;
      case score.two:
      result15 = 2;   
      break;
      case score.three:
      result15 = 3;   
      break;
      case score.four:
      result15 = 4;   
      break;
      case score.five:
      result15 = 5;   
      break;
      case score.six:
      result15 = 6;   
      break;
      case score.seven:
      result15 = 7;   
      break;
      case score.eight:
      result15 = 8;   
      break;
      case score.nine:
      result15 = 9;   
      break;
      case score.ten:
      result15 = 10;   
      break;      
    }
      switch(_score16){
      case score.zero:
      result16 = 0;
      break;
      case score.one:
      result16 = 1;   
      break;
      case score.two:
      result16 = 2;   
      break;
      case score.three:
      result16 = 3;   
      break;
      case score.four:
      result16 = 4;   
      break;
      case score.five:
      result16 = 5;   
      break;
      case score.six:
      result16 = 6;   
      break;
      case score.seven:
      result16 = 7;   
      break;
      case score.eight:
      result16 = 8;   
      break;
      case score.nine:
      result16 = 9;   
      break;
      case score.ten:
      result16 = 10;   
      break;      
    }
      switch(_score17){
      case score.zero:
      result17 = 0;
      break;
      case score.one:
      result17 = 1;   
      break;
      case score.two:
      result17 = 2;   
      break;
      case score.three:
      result17 = 3;   
      break;
      case score.four:
      result17 = 4;   
      break;
      case score.five:
      result17 = 5;   
      break;
      case score.six:
      result17 = 6;   
      break;
      case score.seven:
      result17 = 7;   
      break;
      case score.eight:
      result17 = 8;   
      break;
      case score.nine:
      result17 = 9;   
      break;
      case score.ten:
      result17 = 10;   
      break;      
    }
      switch(_score18){
      case score.zero:
      result18 = 0;
      break;
      case score.one:
      result18 = 1;   
      break;
      case score.two:
      result18 = 2;   
      break;
      case score.three:
      result18 = 3;   
      break;
      case score.four:
      result18 = 4;   
      break;
      case score.five:
      result18 = 5;   
      break;
      case score.six:
      result18 = 6;   
      break;
      case score.seven:
      result18 = 7;   
      break;
      case score.eight:
      result18 = 8;   
      break;
      case score.nine:
      result18 = 9;   
      break;
      case score.ten:
      result18 = 10;   
      break;      
    }
      switch(_score19){
      case score.zero:
      result19 = 0;
      break;
      case score.one:
      result19 = 1;   
      break;
      case score.two:
      result19 = 2;   
      break;
      case score.three:
      result19 = 3;   
      break;
      case score.four:
      result19 = 4;   
      break;
      case score.five:
      result19 = 5;   
      break;
      case score.six:
      result19 = 6;   
      break;
      case score.seven:
      result19 = 7;   
      break;
      case score.eight:
      result19 = 8;   
      break;
      case score.nine:
      result19 = 9;   
      break;
      case score.ten:
      result19 = 10;   
      break;      
    }
      switch(_score20){
      case score.zero:
      result20 = 0;
      break;
      case score.one:
      result20 = 1;   
      break;
      case score.two:
      result20 = 2;   
      break;
      case score.three:
      result20 = 3;   
      break;
      case score.four:
      result20 = 4;   
      break;
      case score.five:
      result20 = 5;   
      break;
      case score.six:
      result20 = 6;   
      break;
      case score.seven:
      result20 = 7;   
      break;
      case score.eight:
      result20 = 8;   
      break;
      case score.nine:
      result20 = 9;   
      break;
      case score.ten:
      result20 = 10;   
      break;      
      }
      finalresult = 0;
    finalresult = (result1+result2+result3+result4+result5+result6+result7+result8+result9+result10+result11+result12+result13+result14+result15+result16+result17+result18+result19+result20)/20*10;
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HandresultPage(result: finalresult,)
              )
                    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('腱鞘炎チェック'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//_score1
const Padding(padding: EdgeInsets.all(10),
child: Text('1.両手で洗顔する',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand1.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score1,
          onChanged: (value){
            _onChanged(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score2
const Padding(padding: EdgeInsets.all(10),
child: Text('2.両手の爪を切る\n（爪切りを使って）',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand2.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score2,
          onChanged: (value){
            _onChanged2(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score3
const Padding(padding: EdgeInsets.all(10),
child: Text('3.両手でのシャツの\nボタンのかけはずし',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand3.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score3,
          onChanged: (value){
            _onChanged3(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score4
const Padding(padding: EdgeInsets.all(10),
child: Text('4.わるいほうの手でコインを拾う',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand4.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score4,
          onChanged: (value){
            _onChanged4(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score5
const Padding(padding: EdgeInsets.all(10),
child: Text('5.わるいほうの手で蛇口をひねる',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand5.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score5,
          onChanged: (value){
            _onChanged5(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score6
const Padding(padding: EdgeInsets.all(10),
child: Text('6.両手を使って\n牛乳パックを開ける',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand6.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score6,
          onChanged: (value){
            _onChanged6(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score7
const Padding(padding: EdgeInsets.all(10),
child: Text('7.ペットボトルのフタを開ける',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand7.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score7,
          onChanged: (value){
            _onChanged7(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score8
const Padding(padding: EdgeInsets.all(10),
child: Text('8.タオルをかたく絞る',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand8.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score8,
          onChanged: (value){
            _onChanged8(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score9
const Padding(padding: EdgeInsets.all(10),
child: Text('9.包丁でリンゴの皮をむく',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand9.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score9,
          onChanged: (value){
            _onChanged9(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score10
const Padding(padding: EdgeInsets.all(10),
child: Text('10.わるいほうの手で\n円形のドアノブを回し\n重いドアを開ける',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand10.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score10,
          onChanged: (value){
            _onChanged10(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score11
const Padding(padding: EdgeInsets.all(10),
child: Text('11.頭上の棚に両手で重いカバンをのせる（5kgのカバン）',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand11.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score11,
          onChanged: (value){
            _onChanged11(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score12
const Padding(padding: EdgeInsets.all(10),
child: Text('12.洗濯物を洗濯バサミを\n使って干す',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand12.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score12,
          onChanged: (value){
            _onChanged12(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score13
const Padding(padding: EdgeInsets.all(10),
child: Text('13.両手で髪を洗う',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand13.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score13,
          onChanged: (value){
            _onChanged13(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score14
const Padding(padding: EdgeInsets.all(10),
child: Text('14.わるいほうの手で\n新聞のページをめくる',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand14.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score14,
          onChanged: (value){
            _onChanged14(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score15
const Padding(padding: EdgeInsets.all(10),
child: Text('15.力仕事を精一杯できる',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand15.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score15,
          onChanged: (value){
            _onChanged15(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score16
const Padding(padding: EdgeInsets.all(10),
child: Text('16.わるいほうの手を人前に\n出しても美容的に気にならない',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand16.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score16,
          onChanged: (value){
            _onChanged16(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score17
const Padding(padding: EdgeInsets.all(10),
child: Text('17.趣味ができる\n（絵，裁縫，スポーツなど）',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand17.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score17,
          onChanged: (value){
            _onChanged17(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score18
const Padding(padding: EdgeInsets.all(10),
child: Text('18.日常生活が普通にできる',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand18.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score18,
          onChanged: (value){
            _onChanged18(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score19画像なし
const Padding(padding: EdgeInsets.all(10),
child: Text('19.わるいほうの手は\nどの程度痛いですか',style: TextStyle(fontSize: 25,color: Colors.black))
),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score19,
          onChanged: (value){
            _onChanged19(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
//_score20
const Padding(padding: EdgeInsets.all(10),
child: Text('20.わるいほうの手のために\n自信を失っている',style: TextStyle(fontSize: 25,color: Colors.black))
),
Image.asset("assets/hand20.png"),
Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.zero,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('0')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.one,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('1')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.two,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('2')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.three,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('3')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.four,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('4')
      ],
    ),
    ]),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    Column(
      children: [
        Radio(
          value: score.five,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('5')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.six,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('6')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.seven,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('7')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.eight,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('8')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.nine,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('9')
      ],
    ),
    Column(
      children: [
        Radio(
          value: score.ten,
          groupValue: _score20,
          onChanged: (value){
            _onChanged20(value);
            }
        ),
        Text('10')
      ],
    ),
    ]
    ),
  ],
),
  ElevatedButton(
    onPressed: (){
      _result();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      elevation: 16,
    ),
    child: Text('結果を送信する',style: TextStyle(fontSize: 20,color: Colors.white)),
  ), 
        ],
        
        ),
      ),
    );
  }
}
