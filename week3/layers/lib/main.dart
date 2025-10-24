import 'ui/quiz_console.dart';
import 'data/quizRepository.dart';

void main() {
  final file = Quizrepository('lib/data/quizData.json');

  final quiz = file.getQuiz();

  if (quiz.questions.isEmpty) {
    throw Exception('Quiz has no questions.');
  }

  QuizConsole console = QuizConsole(quiz: quiz, jsonFile: file);
  console.startQuiz();
}
