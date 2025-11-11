import 'package:flutter/material.dart';
import './hobby_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icons.travel_explore,
                backgroundColor: const Color.fromARGB(255, 52, 192, 57),
              ),
              HobbyCard(
                title: "Skating",
                icon: Icons.skateboarding,
                backgroundColor: const Color.fromARGB(255, 19, 50, 76),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
