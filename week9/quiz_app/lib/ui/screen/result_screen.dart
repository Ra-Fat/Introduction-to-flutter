import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import '../../model/answers_model.dart';
import '../theme/theme.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final List<Answer> playerAnswer;
  final Quiz quiz;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;
  const ResultScreen({
    super.key,
    required this.playerAnswer,
    required this.quiz,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    final totalQuestions = quiz.questions.length;
    final score = quiz.calculateScore(playerAnswer);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score out of $totalQuestions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              label: 'Restart Quiz', 
              onPressed: onRestart,
              backgroundColor: Colors.red,
            ),
            SizedBox(height: 16),
            CustomButton(
              label: 'View History', 
              onPressed: onViewHistory
            )
          ],
        ),
      ),
    );
  }
}
