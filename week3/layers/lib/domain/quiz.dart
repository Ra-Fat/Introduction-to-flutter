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
  final String questionId;
  final String answerChoice;
  

  Answer({ String? id, required this.questionId, required this.answerChoice,}) : id = id ?? uuid.v4();

  bool isGood(Question question){
    return answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  final List<Question> questions;

  Quiz({ String? id, required this.questions,}) : id = id ?? uuid.v4();

  Question? getQuestionById(String id){
    try{
      return questions.firstWhere((q) => q.id == id);
    }catch (e) {
      return null;
    }
  }
}

class Submission {
  final String id;
  final String quizId;
  final List<Answer> answers = [];

  Submission({String? id, required this.quizId}) : id = id ?? uuid.v4();

  void addAnswer(Answer answer){
    answers.add(answer);
  }

  Answer? getAnswerById(String id){
    try {
      return answers.firstWhere((a) => a.id == id);
    } catch (e) {
      return null;
    }
  }

  int getScoreInPoint(Quiz quiz){
    int totalScore = 0;
    for (var answer in answers) {
      Question? question = quiz.getQuestionById(answer.questionId);
      if (question != null && answer.isGood(question)) {
        totalScore += question.score;
      }
    }
    return totalScore;
  }

  int getScoreInPercentage(Quiz quiz){
    int totalScore = getScoreInPoint(quiz);
    int maxScore = quiz.questions.fold(0, (sum, q) => sum + q.score);
    return maxScore == 0 ? 0 : ((totalScore / maxScore) * 100).toInt();
  }
}


