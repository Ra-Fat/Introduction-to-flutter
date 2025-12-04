import '../../model/quiz_model.dart';
import '../../model/questions_model.dart';


Quiz mockQuiz() {
  return Quiz(
    questions: [
      Question(
        title: 'What 5-5 = ?',
        answers: ['0', '1', '-1', '3'],
        correctAnswer: '0',
      ),
      Question(
        title: 'What 5-2+1 = ?',
        answers: ['4', '5', '2', '1'],
        correctAnswer: '4',
      ),
      Question(
        title: 'what 1+1 = ?',
        answers: ['2', '3', '1', '0'],
        correctAnswer: '2',
      ),
    ],
    answers: [],
  );
}
