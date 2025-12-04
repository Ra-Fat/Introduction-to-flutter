import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;
  const StartScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/quizLogo.png'),
              width: 300,
              height: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 60),
            CustomButton(
              label: "START", 
              onPressed: onStart
            ),
          ],
        ),
      ),
    );
  }
}
