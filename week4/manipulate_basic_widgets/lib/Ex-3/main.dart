
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
                  CustomCard(text: "OOP", color: Colors.blue[100]!,),
                  CustomCard(text: "DART", color: Colors.blue[300]!,),
                  CustomCard(
                    text: "FLUTTER",
                    gradient: LinearGradient(colors: [
                      Colors.blue[300]!,
                      Colors.blue[600]!
                    ]),
                  ),
              ],
          ),
      ),
    )
  );
}


class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({
      super.key,
      required this.text,
      this.color = Colors.blue,
      this.gradient
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
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