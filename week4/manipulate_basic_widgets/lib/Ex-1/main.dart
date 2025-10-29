import 'package:flutter/material.dart';

void main() {
  runApp(
     const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 66, 157, 232),
        body: Center(        
          child: Text(
            "I am Jack!!!",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 50,              
            ),
          ),
        ),
      ),
    )
  );
}