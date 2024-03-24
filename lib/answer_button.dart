import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answerText,required this.chooseAnswerTap,super.key});

  final void Function() chooseAnswerTap;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: chooseAnswerTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        child:  Text(answerText,textAlign: TextAlign.center,)
    );
  }
}
