import 'package:flutter/material.dart';
import './score_card.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        color: Colors.green,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScoreCard(subject: "Flutter"),
              ScoreCard(subject: "Game"),
              ScoreCard(subject: "Dart"),
              ScoreCard(subject: "Cyber"),
              ScoreCard(subject: "React"),
              ScoreCard(subject: "C#"),
              ScoreCard(subject: "Backend"),
              ScoreCard(subject: "Frontend"),
            ],
          ),
        ),
      ),
    ),
  ),
);
