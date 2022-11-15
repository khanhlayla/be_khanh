import 'package:bekhanh/answer.dart';
import 'package:bekhanh/question.dart';
import 'package:bekhanh/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  int _numberOfCorrect = 0;
  bool _isPass = false;

  // 60fps 60 frame per second
  final _listOfQuiz = const [
    {
      'question':
          'Phản ứng nào sau đây được sử dụng để điều chế H3PO4 trong phòng thí nghiệm?',
      'answers': [
        {
          'answer': 'A. P + HNO3 đặc, nóng',
          'isCorrect': true,
        },
        {
          'answer': 'B. Ca3(PO4)2 + H2SO4 đặc',
          'isCorrect': false,
        },
        {
          'answer': 'C. P2O5 + H2O',
          'isCorrect': false,
        },
        {
          'answer': 'D. HPO3 + H2O',
          'isCorrect': false,
        },
      ],
    },
    {
      'question': 'Dãy các chất đều là chất điện li mạnh là',
      'answers': [
        {
          'answer': 'A. KOH, NaCL, H2CO3.',
          'isCorrect': false,
        },
        {
          'answer': 'B. Na2S, Mg(OH)2 , HCl.',
          'isCorrect': false,
        },
        {
          'answer': 'C. HClO, NaNO3, Ca(OH)3.',
          'isCorrect': false,
        },
        {
          'answer': 'D. HCl, Fe(NO3)3, Ba(OH)2.',
          'isCorrect': true,
        },
      ],
    },
    {
      'question':
          'Trộn 100 ml dung dịch HCl có pH = 1 với 100 ml dung dịch gồm KOH 0,1m và NaOH aM, thu được 200 ml dung dịch có pH = 12. Giá trị của a là',
      'answers': [
        {
          'answer': 'A. 0,12 ',
          'isCorrect': false,
        },
        {
          'answer': 'B. 0.08',
          'isCorrect': false,
        },
        {
          'answer': 'C. 0,02..',
          'isCorrect': true,
        },
        {
          'answer': 'D. 0,10.',
          'isCorrect': false,
        },
      ],
    },
    {
      'question': ' Muối được làm bột nở trong thực phẩm là',
      'answers': [
        {
          'answer': 'A. (NH4)2CO3.',
          'isCorrect': false,
        },
        {
          'answer': 'B. Na2CO3. ',
          'isCorrect': false,
        },
        {
          'answer': 'C. NH4HSO3.',
          'isCorrect': false,
        },
        {
          'answer': 'D. NH4Cl.',
          'isCorrect': true,
        },
      ],
    },
    {
      'question': 'Nhận xét nào sau đây không đúng về muối amoni ',
      'answers': [
        {
          'answer': 'A. Muối amoni bền với nhiệt.',
          'isCorrect': true,
        },
        {
          'answer': 'B. Các muối amoni đều là chất điện li mạnh. ',
          'isCorrect': false,
        },
        {
          'answer': 'C. Tất cả các muối amoni đều tan trong nước.',
          'isCorrect': false,
        },
        {
          'answer': 'D. các muối amoni đều bị thủy phân trong nước.',
          'isCorrect': false,
        },
      ],
    },
  ];

  void _nextQuestion(bool isCorrect) {
    setState(() {
      _index++;
    });

    if (isCorrect) {
      setState(() {
        _numberOfCorrect++;
      });
    }

    if (_numberOfCorrect >= (_listOfQuiz.length / 2).ceil()) {
      setState(() {
        _isPass = true;
      });
    }
  }

  void _reset() {
    if (_index == _listOfQuiz.length) {
      setState(() {
        _index = 0;
        _numberOfCorrect = 0;
        _isPass = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 98, 179, 249),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(197, 34, 10, 255),
          title: const Text(
            'My Quiz App',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 254, 254),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: _index < _listOfQuiz.length
              ? Column(
                  children: [
                    Question(
                        question: _listOfQuiz[_index]['question'].toString()),
                    ...(_listOfQuiz[_index]['answers'] as List).map((answer) {
                      return Answer(
                        answer: answer['answer'].toString(),
                        nextQuestion: () => _nextQuestion(answer['isCorrect']),
                      );
                    }).toList(),
                  ],
                )
              : Result(
                  numberOfCorrect: _numberOfCorrect,
                  totalQuestion: _listOfQuiz.length,
                  isPass: _isPass,
                  reset: _reset,
                ),
          // child: Demo(),
        ),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            offset: Offset(1, 3),
            blurRadius: 1,
            spreadRadius: 5,
            blurStyle: BlurStyle.normal,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('QUess'),
    );
  }
}
