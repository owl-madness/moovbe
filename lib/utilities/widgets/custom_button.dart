import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, required this.buttonText, this.bgColor, this.textStyle});
  final void Function() onPressed;
  final String buttonText;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: TextButton(
          onPressed: onPressed,
          child: Container(
            width: double.maxFinite,
            
            alignment: Alignment.center,
            height: 58,
              decoration: BoxDecoration(color: bgColor ?? Colors.white,borderRadius: BorderRadius.circular(10)),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: textStyle?? buttonTextStyle,
              ))),
    );
  }
}

TextStyle buttonTextStyle = TextStyle();
