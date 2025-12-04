import 'package:uuid/uuid.dart';
import './questions_model.dart';
import './answers_model.dart';

var uuid = Uuid();

class Quiz {
  final String id;
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({
    String? id,
    required this.questions,
    required this.answers,
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



