import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summary});

  //children, child(only 1 )

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //after this can use many child
            ...summary.map(
              (data) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(
                          '${(data['question_id'] as int) + 1}', //Change to integer to +1
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['question']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            '${data['user_answer']}',
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            '${data['correct_answer']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      )),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
