import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oliftrop/components/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCVButton extends StatelessWidget {
  final String cvUrl;
  const DownloadCVButton({super.key, required this.cvUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(cvUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          Fluttertoast.showToast(
            msg: "Something went wrong",
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blue),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Download CV",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox.square(dimension: 12),
            FaIcon(
              FontAwesomeIcons.download,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
