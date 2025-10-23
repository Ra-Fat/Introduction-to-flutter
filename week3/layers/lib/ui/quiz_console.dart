import 'dart:io';

import 'package:my_first_project/data/quizRepository.dart';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;
  final Quizrepository jsonFile;

  Map<String, int> playerScores = {};
  QuizConsole({required this.quiz , required this.jsonFile});

  void startQuiz() {
    
    print('--- Welcome to the Quiz ---\n');
    String userName = "";

    while(true){
        stdout.write("Your Name: ");
        userName = stdin.readLineSync() ?? '';

        if (userName.isEmpty) {
          break;
        }

        Submission submission = Submission(quizId: quiz.id);

        for (var question in quiz.questions) {
          print('Question: ${question.title} - (${question.score})');
          print('Choices: ${question.choices}');
          stdout.write('Your answer: ');
          String? userInput = stdin.readLineSync();

          // Check the input is not null
          if (userInput != null && userInput.isNotEmpty) {
            Answer answer = Answer(questionId: question.id, answerChoice: userInput);
            submission.addAnswer(answer);
          } else {
            print('No answer entered. Skipping question.');
          }
          print('');
        }

      int scoreInPercentage = submission.getScoreInPercentage(quiz);
      int scoreInPoint = submission.getScoreInPoint(quiz);
      playerScores[userName] = scoreInPoint;

      print('$userName, Your score: in percentage: $scoreInPercentage %');
      print('$userName, Your score: in points: $scoreInPoint');

      playerScores.forEach((name, score){
          print("Player : $name      score: $score");
      });

      // recorded player attemped
      jsonFile.uploadPlayerAttempted(quiz, submission, playerName: userName);

    };
    print('--- Quiz Finished ---');    
  }
}
 