import 'package:flutter/src/widgets/basic.dart';
import 'package:oliftrop/components/common_text.dart';

class AllHeaderText {
  static projectHeader() {
    return Column(
      children: [
        CommonText(
          text: "Projects",
          fontSize: 26,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        CommonText(
          text: "Here are few details of my previous work :)",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  static journeyHeader() {
    return CommonText(
      text: "My Journey 🚀",
      fontSize: 26,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  static skillsHeader() {
    return CommonText(
      text: "Skills: Technologies I work with",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }
}
