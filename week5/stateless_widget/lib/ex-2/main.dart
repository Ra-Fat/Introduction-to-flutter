import 'package:flutter/material.dart';

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
                CustomButton(label: "Submit", icon: Icons.check , position: ButtonPosition.left, type: ButtonType.primary,),
                CustomButton(label: "Time", icon: Icons.timelapse , position: ButtonPosition.right, type: ButtonType.secondary,),
                CustomButton(label: "Account", icon: Icons.account_balance , position: ButtonPosition.right, type: ButtonType.disabled,),
            ],
          )),
      ),
    ),
  );
}

enum ButtonType { primary, secondary, disabled }

enum ButtonPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonPosition position;
  final ButtonType type;
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = ButtonPosition.left,
    this.type = ButtonType.primary,
  });

  Color backgroundColorPicker() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = backgroundColorPicker();
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: position == ButtonPosition.left ?

            [
              Icon(icon, color: Colors.black,),
              SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15
                ),
              )
            ]
            :
            [           
              Text(
                label,              
                style: TextStyle(
                  fontSize: 15
                ),
              ),
              SizedBox(width: 5),          
              Icon(icon, color: Colors.black,)
            ]
        ),
    );
  }
}
