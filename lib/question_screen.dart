import 'package:flutter/material.dart';
import 'package:myapp/answer_button.dart';
import 'package:myapp/data/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen> {

  final currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center, //ทำให้เยื้องไปตรงกลาง
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...currentQuestion.answer.map((answer) {
                    return AnswerButton(answer);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
