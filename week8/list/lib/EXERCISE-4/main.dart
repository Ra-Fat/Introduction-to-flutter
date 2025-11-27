import 'package:flutter/material.dart';
import './ui/screens/favorite_card.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: const FavoriteCardContainer(),
    ),
  ),
);
