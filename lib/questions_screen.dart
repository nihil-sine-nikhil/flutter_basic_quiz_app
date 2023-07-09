import 'dart:math';

import 'package:flutter/material.dart';

import 'answer_button.dart';
import 'data/questions.dart';

var rand = Random();

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int i = 0;
  void nextAnswer() {
    print(i);

    if (i == questions.length - 1) {
      return;
    }
    setState(() {
      i += 1;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[i].text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 30),
          ...questions[i].answers.map((e) => AnswerButton(
                answerText: e,
                onTap: nextAnswer,
              )),
        ],
      ),
    );
  }
}
