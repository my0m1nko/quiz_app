import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen ;
  List<String> _selectedAnswer =[];
  var _activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen(){
    setState(() {
      _activeScreen ='question-screen';
    });
  }

  void choseAns(String ans){
    _selectedAnswer.add(ans);

    if(_selectedAnswer.length == questionsData.length){
      setState(() {
        // selectedAnswer =[];
        _activeScreen = "result-screen";
      });
    }

  }
  void restartQuiz(){
    setState(() {
      _selectedAnswer =[];
      _activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if(_activeScreen == 'question-screen'){
      screenWidget =  QuestionScreen(onSelectedAnswer: choseAns);
    }
    if(_activeScreen =='result-screen'){
      screenWidget = ResultScreen(chooseAnswer:_selectedAnswer,onRestart: restartQuiz,);
    }
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.redAccent
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget
        ),
      ),
    );
  }
}
