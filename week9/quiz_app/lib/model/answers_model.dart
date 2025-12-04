import 'package:uuid/uuid.dart';
import './questions_model.dart';

var uuid = Uuid();


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