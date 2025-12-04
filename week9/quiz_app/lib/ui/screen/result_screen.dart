import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;
  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {

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
