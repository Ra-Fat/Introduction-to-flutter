import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  Map<String, int> playerScores = {};
  QuizConsole({required this.quiz});

  void startQuiz() {
    
    print('--- Welcome to the Quiz ---\n');
    String userName = "";

    while(true){
        stdout.write("Your Name: ");
        userName = stdin.readLineSync() ?? '';

        if (userName.isEmpty) {
          break;
        }

        quiz.clearAnswer();

        for (var question in quiz.questions) {
          print('Question: ${question.title} - (${question.score})');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();

          // Check for null input
          if (userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(question: question, answerChoice: userInput);
            quiz.addAnswer(answer);
          } else {
            print('No answer entered. Skipping question.');
          }
          print('');
        }

      int scoreInPercentage = quiz.getScoreInPercentage();
      int scoreInPoint = quiz.getScoreInPoint();
      playerScores[userName] = scoreInPoint;

      print('$userName, Your score: in percentage: $scoreInPercentage %');
      print('$userName, Your score: in points: $scoreInPoint');

      playerScores.forEach((name, score){
          print("Player : $name      score: $score");
      });

    };
    print('--- Quiz Finished ---');    
  }
}
 