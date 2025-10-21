class Question{
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int score;

  Question({required this.title, required this.choices, required this.goodChoice, this.score=1});
}

class Answer{
  final Question question;
  final String answerChoice;
  

  Answer({required this.question, required this.answerChoice});

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  List<Question> questions;
  List <Answer> answers =[];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
     this.answers.add(asnwer);
  }

  void clearAnswer(){
    this.answers.clear();
  }

  int getScoreInPercentage(){
    int totalSCore = 0;
    int maxScore = 0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        totalSCore += answer.question.score;
      }
    }
    for(Question question in questions){
        maxScore += question.score;
    }
    return ((totalSCore/ maxScore)*100).toInt();

  }
  int getScoreInPoint(){
    int totalSCore =0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        totalSCore += answer.question.score;
      }
    }
    return totalSCore;
  }
}