import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oliftrop/components/common_text.dart';
import 'package:oliftrop/controller/about_controller.dart';
import 'package:oliftrop/ui/widgets/about_widget.dart';
import 'package:oliftrop/ui/widgets/contact_widget.dart';
import 'package:oliftrop/ui/widgets/down_load_cv_button.dart';
import 'package:oliftrop/ui/widgets/journey_view_widget.dart';
import 'package:oliftrop/ui/widgets/project_view_widget.dart';
import 'package:oliftrop/ui/widgets/skills_view_widget.dart';

import '../../components/all_header_text.dart';
import '../../components/app_colors.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        AboutWidget(),
        SizedBox(height: 20),
        AllHeaderText.skillsHeader(),
        SkillsViewWidget(),
        AllHeaderText.projectHeader(),
        ProjectViewWidget(),
        SizedBox(height: 20),
        AllHeaderText.journeyHeader(),
        SizedBox(height: 10),
        JourneyViewWidget(),
        GetInTouchSection(),
        CommonText(
          textAlign: TextAlign.center,
          text: "Developed With Flutter💻",
          color: AppColors.blue,
        ),
      ],
    );
  }
}
