import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oliftrop/controller/about_controller.dart';
import 'package:oliftrop/ui/widgets/down_load_cv_button.dart';
import 'package:oliftrop/ui/widgets/socail_widget.dart';
import 'package:oliftrop/utils/responsive.dart';
import '../../components/app_colors.dart';
import '../../components/common_text.dart';

class AboutWidget extends StatelessWidget {
  AboutWidget({super.key});

  final AboutController _controller = Get.find<AboutController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        final passionateText = _controller.getPassionateText();
        final cvUrl = _controller.getCVUrl();
        return Responsive.isMobile(context)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildProfileImage(),
                  const SizedBox(height: 20),
                  _buildTextSection(
                      TextAlign.center, passionateText, cvUrl, context),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildProfileImage(),
                  const SizedBox(width: 40),
                  Expanded(
                      child: _buildTextSection(
                          TextAlign.start, passionateText, cvUrl, context)),
                ],
              );
      },
    );
  }

  Widget _buildTextSection(TextAlign align, String passionateText, String cvUrl,
      BuildContext context) {
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Vaishanvi Ingole",
          color: AppColors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          textAlign: align,
        ),
        const SizedBox(height: 8),
        CommonText(
          text: "Android Developer",
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          textAlign: align,
        ),
        const SizedBox(height: 10),
        CommonText(
          text: passionateText,
          color: AppColors.white,
          fontSize: 12,
          textAlign: align,
        ),
        const SizedBox(height: 10),
        Responsive.isMobile(context)
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: DownloadCVButton(cvUrl: cvUrl),
                  ),
                  const SizedBox(height: 20),
                  const SocialWidget(),
                ],
              )
            : Row(
                children: [
                  DownloadCVButton(cvUrl: cvUrl),
                  const SizedBox(width: 20),
                  const SocialWidget(),
                ],
              ),
      ],
    );
  }

  Widget buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1),
        gradient: LinearGradient(
          colors: [AppColors.blue, const Color(0xFF9370DB)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue,
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/pro.jpg',
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
