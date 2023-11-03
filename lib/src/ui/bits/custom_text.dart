import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.data,
      this.fontSize,
      this.fontWeight,
      this.textColor});

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
    );
  }
}
