import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oliftrop/components/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  // Define your social links and icons in a list
  final List<_SocialLink> _socialLinks = const [
    _SocialLink(
      icon: FontAwesomeIcons.linkedinIn,
      url: "https://www.linkedin.com/in/vaishanvi-ingole-a72761218",
      tooltip: "LinkedIn",
    ),
    _SocialLink(
      icon: FontAwesomeIcons.github,
      url: "https://github.com/vaishu159",
      tooltip: "GitHub",
    ),
    _SocialLink(
      icon: FontAwesomeIcons.phone,
      url: "tel:9673108423",
      tooltip: "Phone",
    ),
    _SocialLink(
      icon: Icons.email,
      url: "mailto:vaishanvi.ingole53@gmail.com",
      tooltip: "Email",
    ),
    _SocialLink(
      icon: FontAwesomeIcons.medium,
      url: "https://medium.com/@vaishanviingole096",
      tooltip: "Medium",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _socialLinks.map((link) => _buildIcon(link)).toList(),
    );
  }

  Widget _buildIcon(_SocialLink link) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.blue),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        hoverColor: AppColors.blue.withOpacity(0.2),
        tooltip: link.tooltip,
        onPressed: () async {
          final Uri uri = Uri.parse(link.url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            Fluttertoast.showToast(msg: "Something went wrong");
          }
        },
        icon: FaIcon(link.icon, color: Colors.white, size: 15),
      ),
    );
  }
}

// Helper model class for social links
class _SocialLink {
  final IconData icon;
  final String url;
  final String tooltip;

  const _SocialLink({
    required this.icon,
    required this.url,
    required this.tooltip,
  });
}
