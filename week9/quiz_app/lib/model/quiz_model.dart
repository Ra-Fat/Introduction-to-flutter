import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Quiz {
  final String id;
  final List<Question> questions;

  Quiz({
    String? id,
    required this.questions,
  }): id = id ?? uuid.v4();

  int calculateScore(List<Answer> answers) {
    int score = 0;
    for (var question in questions) {
      final answer = answers.firstWhere(
        (a) => a.questionId == question.id,
        orElse: () => Answer(id: '', questionId: '', answerChoice: ''),
      );
      if (answer.id != '' && answer.isCorrect(question)) {
        score++;
      }
    }
    return score;
  }
}

class Question {
  final String id;
  final String title;
  final List<String> answers;
  final String correctAnswer;

  Question({
    String? id,
    required this.title,
    required this.answers,
    required this.correctAnswer,
  }): id = id ?? uuid.v4();

  bool isCorrectAnswer(String answer){
    return answer == correctAnswer;
  }
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice
  }): id = id ?? uuid.v4();

  bool isCorrect(Question question){
    return answerChoice == question.correctAnswer;
  } 
}
