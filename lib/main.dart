import 'package:flutter/material.dart';
import 'package:myapp/question_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
            ),
          ),
          child: QuestionScreen(),
        ),
      ),
    ),
  );
}
