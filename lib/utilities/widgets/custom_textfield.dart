import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({super.key, this.hintText, this.controller});
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 7,horizontal:25 ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(10))),
          filled: true,
          fillColor: Color.fromRGBO(42, 42, 42, 0.1)
        ),
      ),
    );
  }
}