import 'package:flutter/material.dart';
import './custom_button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Custom Bottons",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                position: ButtonPosition.left,
                type: ButtonType.primary,
              ),
              CustomButton(
                label: "Time",
                icon: Icons.timelapse,
                position: ButtonPosition.right,
                type: ButtonType.secondary,
              ),
              CustomButton(
                label: "Account",
                icon: Icons.account_balance,
                position: ButtonPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

