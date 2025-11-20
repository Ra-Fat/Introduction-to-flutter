import 'package:flutter/material.dart';
import 'custom_button.dart';
void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            CustomButton(),
            CustomButton(),
            CustomButton(),
            CustomButton(),
          ],
        ),
      ),
    ),
  ),
);

