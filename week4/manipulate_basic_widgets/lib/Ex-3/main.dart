
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: const Color.fromARGB(255, 173, 174, 174),
        padding: EdgeInsets.all(20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  CustomCard(text: "OOP", firstColor: Colors.blue[100]),
                  CustomCard(text: "DART", firstColor: Colors.blue[300]),
                  CustomCard(text: "FLUTTER", firstColor: Colors.blue[300], secondColor: Colors.blue[600],),
                  
              ],
          ),
      ),
    )
  );
}


class CustomCard extends StatelessWidget {
  final String text;
  final Color? firstColor;
  final Color? secondColor;
  const CustomCard({
      required this.text,
      this.firstColor,
      this.secondColor,
      super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: (firstColor != null && secondColor == null) ? firstColor : null,
          gradient: (firstColor != null && secondColor != null)
              ? LinearGradient(colors: [firstColor!, secondColor!])
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
    );
  }
}