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
    
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "4"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));

    expect(submission.getScoreInPoint(quiz), equals(50));
    expect(submission.getScoreInPercentage(quiz), equals(100));

  });

  test('First answer wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));

    expect(submission.getScoreInPoint(quiz), equals(20));
    expect(submission.getScoreInPercentage(quiz), equals(((20 / 50) * 100).toInt()));
  });


  test('Second answer wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "4"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));

    expect(submission.getScoreInPoint(quiz), equals(30));
    expect(submission.getScoreInPercentage(quiz), equals(((30 / 50) * 100).toInt()));
  });

  test('Second answer wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "4"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));

    expect(submission.getScoreInPoint(quiz), equals(30));
    expect(submission.getScoreInPercentage(quiz), equals(((30 / 50) * 100).toInt()));
  });

  test('First answer wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "1"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "5"));

    expect(submission.getScoreInPoint(quiz), equals(20));
    expect(submission.getScoreInPercentage(quiz), equals(((20 / 50) * 100).toInt()));
  });

  test('Second answer worng', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "4"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "1"));

    expect(submission.getScoreInPercentage(quiz), equals(((30/50) * 100).toInt()));
    expect(submission.getScoreInPoint(quiz), equals(30));

  });

  test('All answers is wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));


    expect(submission.getScoreInPercentage(quiz), equals(0));
    expect(submission.getScoreInPoint(quiz), equals(0));

  });

  test('All answers is wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "2"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "1"));

    expect(submission.getScoreInPoint(quiz), equals(0));
    expect(submission.getScoreInPercentage(quiz), equals(0));
  });

  test('All answers is wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "1"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "2"));


    expect(submission.getScoreInPercentage(quiz), equals(0));
    expect(submission.getScoreInPoint(quiz), equals(0));

  });

  test('All answers wrong', () {
    Submission submission = Submission(quizId: quiz.id);
    submission.addAnswer(Answer(questionId: q1.id, answerChoice: "1"));
    submission.addAnswer(Answer(questionId: q2.id, answerChoice: "1"));

    expect(submission.getScoreInPoint(quiz), equals(0));
    expect(submission.getScoreInPercentage(quiz), equals(0));
  });
}