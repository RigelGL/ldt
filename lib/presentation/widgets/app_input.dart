import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? errorText;

  const AppInput({Key? key, required this.controller, required this.hintText, this.errorText, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 20),
      controller: controller,
      keyboardType: keyboardType,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        errorText: errorText,
        errorMaxLines: 1,
      ),
    );
  }
}
