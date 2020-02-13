import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Quiz App',
        style: TextStyle(color: Colors.white, fontSize: 32.0),
      ),
    );
  }
}
