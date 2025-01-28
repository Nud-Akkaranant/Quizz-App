import 'package:flutter/material.dart';

class AnwerButton extends StatelessWidget {
  const AnwerButton({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 103, 192, 240),
                foregroundColor: Colors.white,
              ),
                child: Text(answer,
                  style: const TextStyle(
                  color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}