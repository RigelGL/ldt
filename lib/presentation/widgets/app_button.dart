import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  final bool bordered;

  const AppButton({Key? key, required this.color, required this.text, this.onPressed, this.bordered = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 56,
      color: bordered ? Colors.white : color,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40), side: bordered ? BorderSide(width: 2, color: color) : BorderSide.none),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 20, color: bordered ? color : Colors.white)),
    );
  }
}
