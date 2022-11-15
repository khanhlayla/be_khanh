import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  const Question({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 5),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        question,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
