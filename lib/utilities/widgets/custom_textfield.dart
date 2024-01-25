import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.controller, this.inputFormatters, this.maxLength});
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: const Color.fromRGBO(42, 42, 42, 0.1)),
      ),
    );
  }
}
