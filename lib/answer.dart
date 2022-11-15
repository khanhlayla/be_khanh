import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer; // field
  final VoidCallback nextQuestion;

  // constructor
  const Answer({
    super.key,
    required this.answer,
    required this.nextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 226, 231, 235),
          backgroundColor: Colors.black26,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          minimumSize: const Size(300, 60),
          maximumSize: const Size(300, 60),
        ),
        onPressed: nextQuestion,
        child: Text(
          answer,
          style: const TextStyle(
            fontSize: 25,
           fontFamily: 'Lora',
          ),
        ),
      ),
    );
  }
}
