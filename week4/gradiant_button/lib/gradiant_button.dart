import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  final String text;
  final Color firstColor;
  final Color secondColor;
  
  const GradiantButton({
      required this.text,
      required this.firstColor,
      required this.secondColor,
      super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(30),
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                firstColor,
                secondColor,
              ])
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
            ),
    );
  }
}