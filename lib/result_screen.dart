import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/question_summary.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.chooseAnswer,required this.onRestart});
  final List<String> chooseAnswer;
  final void Function() onRestart;

  List<Map<String,Object>> _getSummaryData(){
    final List<Map<String,Object>> summary =[];

    for( var i =0; i < chooseAnswer.length; i++){
      summary.add({
        'question_index' : i,
        'question':questionsData[i].text,
        'correct_answer':questionsData[i].answer[0],
        'user_answer':chooseAnswer[i]
      });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = _getSummaryData();
    final numTotalQuestions =questionsData.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('You answer $numCorrectQuestions out of $numTotalQuestions Questions',
               style: GoogleFonts.lato(
                 color: const Color.fromARGB(255, 230, 200, 253),
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionSummary(_getSummaryData()),
            const SizedBox(height: 30,),
            TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
