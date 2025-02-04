import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart'; // Import your quiz data
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart'; // Import StartScreen

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.selectedAnswers, super.key});

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      bool isCorrect = selectedAnswers[i] == questions[i].answers[0];
      summaryData.add({
        'question_id': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': isCorrect
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final totalMark =
        summary.where((data) => data['is_correct'] as bool).length;
    final totalQuestion = questions.length;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: SizedBox(
              child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your answered $totalMark out of $totalQuestion question correctly',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary(summary: getSummaryData()),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                    size: 15,
                  ),
                  label: const Text(
                    'Restart Quiz',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartScreen()));
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );

    // @override
    // Widget build(BuildContext context) {
    //   final isCorrect = (int index) {
    //     // Compare selected answer with the correct answer from your quiz data
    //     return widget.selectedAnswers[index] == questions[index].answers[0];
    //   };

    //   return Container(
    //     decoration: const BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           Color.fromARGB(255, 78, 13, 151),
    //           Color.fromARGB(255, 107, 15, 168),
    //         ],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //       ),
    //     ),
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent, // Make Scaffold background transparent
    //       body: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const SizedBox(height: 40),
    //           const Text(
    //             'Your answered!',
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 20,
    //             ),
    //           ),
    //           const SizedBox(height: 30),
    //           Expanded(
    //             child: ListView.builder(
    //               itemCount: widget.selectedAnswers.length,
    //               itemBuilder: (ctx, index) => Container(
    //                 margin: const EdgeInsets.symmetric(
    //                     horizontal: 30, vertical: 10), // Add horizontal margin
    //                 padding: const EdgeInsets.all(15),
    //                 decoration: BoxDecoration(
    //                   color: isCorrect(index) ? Colors.green : Colors.red,
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Text(
    //                   widget.selectedAnswers[index],
    //                   style: const TextStyle(color: Colors.white, fontSize: 18),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           TextButton(onPressed: () {
    //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartScreen()));
    //           }, child: const Text('Restart Quiz!', style: TextStyle(color: Colors.white, fontSize: 18),))
    //         ],
    //       ),
    //     ),
    //   );
  }
}
