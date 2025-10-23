import 'domain/quiz.dart';
import 'dart:io';
import 'ui/quiz_console.dart';
import 'data/quizRepository.dart';

void main() {

  Quiz defaultQuiz(){
    return Quiz(questions:[
      Question(
          title: "Capital of France?",
          choices: ["Paris", "London", "Rome"],
          goodChoice: "Paris",
          score: 50
      ),
      Question(
          title: "2 + 2 = ?", 
          choices: ["2", "4", "5"], 
          goodChoice: "4",
          score: 10
      ),
    ]);
  };

  final file = Quizrepository('lib/data/quizData.json');
  Quiz quiz;

  try {
    quiz = file.getQuiz();
    if (quiz.questions.isEmpty) {
      quiz = defaultQuiz();
      file.createDefaultQuiz(quiz);
    }
  } catch (e) {
    quiz = defaultQuiz();
    file.createDefaultQuiz(quiz);
  }

  QuizConsole console = QuizConsole(quiz: quiz , jsonFile: file);
  console.startQuiz();
}
