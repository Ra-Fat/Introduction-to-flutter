import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import '../widgets/theme.dart';
import '../../model/answers_model.dart';


class HistoryScreen extends StatelessWidget {
  final List<List<Answer>> history;
  final Quiz quiz;
  final VoidCallback onBack;

  const HistoryScreen({
    super.key,
    required this.quiz,
    required this.history,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quiz History',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: history.isEmpty
            ? Center(
                child: Text(
                  'No quiz attempts yet.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final attempt = history[index];
                  final score = quiz.calculateScore(attempt);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Card(
                      color: Colors.white.withOpacity(0.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          'Attempt ${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          'Score: $score / ${quiz.questions.length}',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: onBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.buttonColor,
              minimumSize: Size(20, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "Back to Home",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
