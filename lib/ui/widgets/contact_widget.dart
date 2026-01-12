import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oliftrop/components/common_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.tealAccent.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Get in Touch',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 12),
          const CommonText(
              text:
                  '✍️ Whether you have a new opportunity, want to collaborate, '
                  'or just want to say hello — my inbox is open. I’d love to hear your story and see how we can create something great together. 😊',
              fontSize: 16),
          const SizedBox(height: 24),
          Wrap(
            spacing: 32,
            runSpacing: 16,
            children: [
              ContactItem(
                icon: Icons.email,
                label: 'Email',
                value: 'vaishanvi.ingole53@gmail.com',
              ),
              ContactItem(
                icon: Icons.location_on,
                label: 'Location',
                value: 'Pune, Maharashtra',
              ),
              ContactItem(
                icon: Icons.phone,
                label: 'Phone',
                value: '9673108423',
              ),
            ],
          ),
          const SizedBox(height: 24),
          CommonText(text: 'Connect with me'),
          const SizedBox(height: 8),
          Row(
            children: [
              InkWell(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse("https://www.linkedin"
                            ".com/in/vaishanvi-ingole-a72761218"),
                        mode: LaunchMode.externalApplication)) {
                      Fluttertoast.showToast(
                        msg: "SomeThing went wrong",
                      );
                    }
                  },
                  child: const Icon(
                    color: Colors.white,
                    FontAwesomeIcons.linkedin,
                  )),
              const SizedBox(width: 12),
              InkWell(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse(
                            "https://www.instagram.com/___vaishanvi/profilecard/?igsh=cW5pd3VyeXA1M2Yw"),
                        mode: LaunchMode.externalApplication)) {
                      Fluttertoast.showToast(
                        msg: "SomeThing went wrong",
                      );
                    }
                  },
                  child: const Icon(
                    color: Colors.white,
                    FontAwesomeIcons.instagram,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                    text: label, fontWeight: FontWeight.bold, fontSize: 14),
                CommonText(text: value, fontSize: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
