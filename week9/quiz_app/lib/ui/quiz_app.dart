import 'package:flutter/material.dart';
import 'screen/welcome_screen.dart';
import 'screen/result_screen.dart';
import 'screen/history_screen.dart';
import '../model/answers_model.dart';
import 'screen/question_screen.dart';
import '../data/repositories/quiz_mock_repository.dart';
import '../model/quiz_model.dart';

enum Screen { startScreen, questionScreen, resultScreen, historyScreen }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Screen currentScreen = Screen.startScreen;
  late Quiz quiz;
  List<List<Answer>> history = [];
  int currentQuestionIndex = 0;
  List<Answer> playerAnswers = [];

  @override
  void initState() {
    super.initState();
    quiz = mockQuiz();
  }

  void onStartPressed() {
    setState(() {
      currentScreen = Screen.questionScreen;
      currentQuestionIndex = 0;
      playerAnswers = [];
    });
  }

  void onAnswerSubmitted(Answer answer) {
    playerAnswers.add(answer);

    if (currentQuestionIndex < quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        history.add(List<Answer>.from(playerAnswers));
        currentScreen = Screen.resultScreen;
      });
    }
  }

  void onShowHistory() {
    setState(() {
      currentScreen = Screen.historyScreen;
    });
  }

  void onBackToStartScreen() {
    setState(() {
      currentScreen = Screen.startScreen;
    });
  }

  void onRestart() {
    setState(() {
      currentScreen = Screen.startScreen;
      playerAnswers = [];
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case Screen.startScreen:
        return StartScreen(onStart: onStartPressed);
      case Screen.questionScreen:
        return QuestionScreen(
          question: quiz.questions[currentQuestionIndex],
          onAnswer: onAnswerSubmitted,
        );
      case Screen.resultScreen:
        return ResultScreen(
          playerAnswer: playerAnswers,
          quiz: quiz,
          onRestart: onRestart,
          onViewHistory: onShowHistory,
        );
      case Screen.historyScreen:
        return HistoryScreen(
          quiz: quiz,
          history: history,
          onBack: onBackToStartScreen,
        );
    }
  }
}
