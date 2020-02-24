import 'package:flutter/material.dart';
//import 'package:flutter_quizz_app/question.dart';
import 'package:flutter_quizz_app/questions.dart';

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
  //List<bool> answers = [false, true, true];

  int currentQuestion = 0;
  int score = 0;
  int correctCounter = 0;
  int wrongCounter = 0;
  bool quizCompleted = false;
  void nextQuestion(bool answer, BuildContext context) {
    setState(() {
      if (!quizCompleted) {
        if (questions[currentQuestion].answer == answer) {
          correctCounter++;
          score += 10;
        } else {
          wrongCounter++;
        }
      }

      if (questions.length - 1 > currentQuestion) {
        currentQuestion++;
      } else {
        print(' The quiz is over');
        quizCompleted = true;
        showResults(context);
      }
    });
  }

  void showResults(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Quiz Completed',
              style: TextStyle(fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.tag_faces,
                    size: 52.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(' Thank for your particpation '),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Your score is ($score) points')
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    quizCompleted = false;
                    score = 0;
                    currentQuestion = 0;
                    wrongCounter = 0;
                    correctCounter = 0;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
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
                nextQuestion(true, context);
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
                nextQuestion(false, context);
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
