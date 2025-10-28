import 'package:flutter/material.dart';
import 'gradiant_button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(       
        body:  Center(      
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [               
                GradiantButton(text: "Hello1", firstColor: Colors.blue, secondColor: Colors.red),
                GradiantButton(text: "Hello2", firstColor: Colors.blue, secondColor: Colors.red),
                GradiantButton(text: "Hello3", firstColor: Colors.blue, secondColor: Colors.red),
              ],
            ),
        ),
      ),
    )
  );
}

