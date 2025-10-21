import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4" , score: 30);

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", score: 20);

  Quiz quiz = Quiz(questions: [q1, q2]);

  test('All answers are good (100%)', () {
    
    Answer a1 = Answer(question: q1, answerChoice: "4");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    expect(quiz.getScoreInPercentage(), equals(100));
    expect(quiz.getScoreInPoint(), equals(50));

  });

  test('One answer worng', () {

    Answer a1 = Answer(question: q1, answerChoice: "2");
    Answer a2 = Answer(question: q2, answerChoice: "5");

    quiz.answers = [a1, a2];

    expect(quiz.getScoreInPercentage(), equals(((20/50) * 100).toInt()));
    expect(quiz.getScoreInPoint(), equals(20));

  });

  test('All answers is wrong', () {

    Answer a1 = Answer(question: q1, answerChoice: "2");
    Answer a2 = Answer(question: q2, answerChoice: "2");

    quiz.answers = [a1, a2];

    expect(quiz.getScoreInPercentage(), equals(0));
    expect(quiz.getScoreInPoint(), equals(0));

  });

}