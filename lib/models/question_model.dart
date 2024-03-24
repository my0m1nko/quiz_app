class QuizQuestion{
  const QuizQuestion(this.text,this.answer);
  final String text;
  final List<String> answer;

  List<String> getShuffledAnswers(){
    final shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }

}