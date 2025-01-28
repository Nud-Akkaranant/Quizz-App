import 'package:flutter/material.dart';
import 'package:myapp/data/quizz.dart'; // Import your quiz data
import 'package:myapp/start_screen.dart'; // Import StartScreen

class ResultScreen extends StatefulWidget {
  const ResultScreen({required this.selectedAnswers, super.key});

  final List<String> selectedAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {    
    final isCorrect = (int index) {
      // Compare selected answer with the correct answer from your quiz data
      return widget.selectedAnswers[index] == questions[index].answers[0]; 
    };

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make Scaffold background transparent
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Your answered!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: widget.selectedAnswers.length,
                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10), // Add horizontal margin
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isCorrect(index) ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.selectedAnswers[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartScreen()));
            }, child: const Text('Restart Quiz!', style: TextStyle(color: Colors.white, fontSize: 18),))
          ],
        ),
      ),
    ); 
  }
}
