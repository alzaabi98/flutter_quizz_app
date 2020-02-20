import 'package:flutter/material.dart';
import 'package:flutter_quizz_app/question.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF0A4A72),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: QuestionsPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Question> questions = [
    Question(text: 'Flutter is mobile development SDK', answer: true),
    Question(text: 'HTML is prograamming language', answer: false),
    Question(text: 'Laravel is php Framework', answer: true),
    Question(text: 'Flutter is mobile development SDK', answer: true),
    Question(text: 'HTML is prograamming language', answer: false),
    Question(text: 'Laravel is php Framework', answer: true)
  ];

  List<bool> answers = [false, true, true];

  int currentQuestion = 0;
  int score = 0;
  int correctCounter = 0;
  int wrongCounter = 0;
  bool quizCompleted = false;
  void nextQuestion(bool answer) {
    setState(() {
      if (!quizCompleted) {
        if (questions[currentQuestion].answer == answer) {
          correctCounter++;
        } else {
          wrongCounter++;
        }
      }

      if (questions.length - 1 > currentQuestion) {
        currentQuestion++;
      } else {
        print(' The quiz is over');
        quizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Text(
            questions[currentQuestion].text,
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Expanded(
          flex: 1,
          child: ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.white,
            splashColor: Colors.orange,
            child: RaisedButton(
              onPressed: () {
                nextQuestion(true);
              },
              child: Text('True', style: TextStyle(fontSize: 32.0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 1,
          child: ButtonTheme(
            minWidth: 200,
            buttonColor: Colors.white,
            splashColor: Colors.orange,
            child: RaisedButton(
              onPressed: () {
                nextQuestion(false);
              },
              child: Text('False', style: TextStyle(fontSize: 32.0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Correct',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    correctCounter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Wrong',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    wrongCounter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
