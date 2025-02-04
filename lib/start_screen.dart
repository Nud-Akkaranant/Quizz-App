import 'package:flutter/material.dart';
import 'package:myapp/question_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Opacity(
                //   opacity: 0.5, //opacity คือระดับความหนาจางของรูปภาพอันนี้ไม่ดี
                Image.asset(
                  '../assets/images/quiz-logo.png',
                  width: 300,
                  color: Colors.white.withOpacity(
                      0.6), //คือระดับความหนาจางของรูปภาพแบบนี้ดีกว่าการประกาศทั้งหมดแบบอันบน
                ),
                const SizedBox(height: 40),
                const Text(
                  'Let learn flutter Gooooo!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuestionScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
                  label: const Text(
                    'Start Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
