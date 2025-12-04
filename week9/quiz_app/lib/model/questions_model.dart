import 'package:uuid/uuid.dart';

var uuid = Uuid();

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