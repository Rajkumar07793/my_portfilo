import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  const CommonText({
    super.key,
    required this.text,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize),
    );
  }
}
