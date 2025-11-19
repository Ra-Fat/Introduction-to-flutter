import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isSelected = false;
  String get labelText => _isSelected ? "Selected" : "Not Selected";
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      _isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: Center(
            child: Text(
              labelText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
