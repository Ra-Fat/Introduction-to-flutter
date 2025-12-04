import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../../model/questions_model.dart';
import '../../model/answers_model.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(Answer answer) onAnswer;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              ...question.answers.map((answerChoice) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      final answer = Answer(
                        questionId: question.id,
                        answerChoice: answerChoice,
                        id: UniqueKey().toString(),
                      );
                      onAnswer(answer);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 70),
                      padding: EdgeInsets.all(14),
                      backgroundColor: AppColor.answerChoiceColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      answerChoice,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
