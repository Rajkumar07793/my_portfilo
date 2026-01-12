import 'package:flutter/material.dart';
import 'package:oliftrop/components/all_header_text.dart';
import 'package:oliftrop/ui/widgets/about_widget.dart';
import 'package:oliftrop/ui/widgets/contact_widget.dart';
import 'package:oliftrop/ui/widgets/journey_view_widget.dart';
import 'package:oliftrop/ui/widgets/project_view_widget.dart';
import 'package:oliftrop/ui/widgets/skills_view_widget.dart';

import '../../components/app_colors.dart';
import '../../components/common_text.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        AboutWidget(),
        SizedBox(height: 20),
        AllHeaderText.skillsHeader(),
        SkillsViewWidget(),
        SizedBox(height: 10),
        AllHeaderText.projectHeader(),
        ProjectViewWidget(),
        SizedBox(height: 20),
        AllHeaderText.journeyHeader(),
        JourneyViewWidget(),
        GetInTouchSection(),
        CommonText(
          textAlign: TextAlign.center,
          text: "Developed With Flutter 💙",
          color: AppColors.blue,
        ),
      ],
    );
  }
}
