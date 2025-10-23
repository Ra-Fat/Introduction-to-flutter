import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question{
  final String  id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int score;

  Question({String? id ,required this.title, required this.choices, required this.goodChoice, this.score=1}): id = id ?? uuid.v4();
}

class Answer{
  final String id;
  final Question question;
  final String answerChoice;
  

  Answer({String? id,required this.question, required this.answerChoice}): id=id ?? uuid.v4();

  bool isGood(){
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz{
  final String id;
  List<Question> questions;
  List <Answer> answers =[];

  Quiz({String? id ,required this.questions}): id= id ?? uuid.v4();

  Question? getQuestionById(String id){
      try{
          return questions.firstWhere((q)=> q.id == id);
      }catch(e){
          return null;
      }
  }

  Answer? getAnswerById(String id){
    try{
      return answers.firstWhere((a)=> a.id == id);
    }catch(e){
        return null;
    }
  }

  void addAnswer(Answer asnwer) {
     answers.add(asnwer);
  }

  void clearAnswer(){
    this.answers.clear();
  }

  
  int getScoreInPercentage() {
    int totalScore = 0;
    int maxScore = 0;

    // calculate the correct answer score 
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalScore += answer.question.score;
      }
    }

    // calculate maximum score of question
    for (Question question in questions) {
      maxScore += question.score;
    }

    // prevent it from division zero
    if (maxScore == 0){
      return 0;
    } 

    return ((totalScore / maxScore) * 100).toInt();
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