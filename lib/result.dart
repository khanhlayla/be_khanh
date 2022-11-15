import 'dart:ui';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // field
  final int numberOfCorrect;
  final int totalQuestion;
  final bool isPass;
  final VoidCallback reset;

  // constructor
  const Result({
    super.key,
    required this.numberOfCorrect,
    required this.totalQuestion,
    required this.isPass,
    required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            isPass ? 'assets/images/happy.png' : 'assets/images/sad.png',
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
          Text(
            '$numberOfCorrect/$totalQuestion',
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            isPass ? "Passed" : "Failed",

            style: TextStyle(

              color:isPass ? Colors.red :Colors.deepPurple,
              fontFamily: 'lora',
              fontSize: isPass ? 30 : 20,
            ),
          ),
          ElevatedButton(
            onPressed: reset,
            child: const Text(
              'Reset',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
