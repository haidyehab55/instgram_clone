import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {

  const TextFieldInput({required this.controller, required this.hintText, this.isPass = false, required this.textInputType});

  final TextEditingController controller;
  final String hintText;
  final bool isPass;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
