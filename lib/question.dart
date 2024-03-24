import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectedAnswer});

  final void Function(String ans) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex =0;
  void answerQuestion(String selectedAns){
    // currentQuestionIndex = currentQuestionIndex + 1;
    widget.onSelectedAnswer(selectedAns);
    setState(() {
      currentQuestionIndex +=1;

    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsData[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
            style: GoogleFonts.lato(
            color : Colors.white,
            fontSize: 24,
            fontWeight : FontWeight.bold
            ),
            textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer,chooseAnswerTap: (){
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
