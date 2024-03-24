
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startGame,{super.key});
  final void Function() startGame;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
        const  SizedBox(height: 80,),
         const Text('Learn Flutter the fun way!',
         style: TextStyle(
           fontSize: 24,
           color: Colors.white70
         ),),
          const SizedBox(height: 30,),
          OutlinedButton.icon(
              onPressed: startGame,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,

              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),))
        ],
      ),
    );
  }
}
