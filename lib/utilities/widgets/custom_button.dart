import 'package:flutter/material.dart';
import 'package:moovbe_bus_booking/utilities/color_resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.bgColor,
      this.textStyle,
      this.height,
      this.width, this.textColor, this.padding});
  final void Function() onPressed;
  final String buttonText;
  final Color? bgColor;
  final EdgeInsets? padding;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 27),
      child: TextButton(
          onPressed: onPressed,
          child: Container(
              width: width ?? double.maxFinite,
              alignment: Alignment.center,
              height: height ?? 58,
              decoration: BoxDecoration(
                  color: bgColor ?? ColorResources.primaryRed,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: textStyle?? TextStyle(color: textColor?? Colors.white),
                // style: textStyle ?? buttonTextStyle,
              ))),
    );
  }
}

TextStyle buttonTextStyle = TextStyle(color: ColorResources.white);
