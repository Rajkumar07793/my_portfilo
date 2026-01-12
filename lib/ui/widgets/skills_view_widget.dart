import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oliftrop/controller/skills_controller.dart';

class SkillsViewWidget extends StatelessWidget {
  SkillsViewWidget({super.key});

  final SkillsController con = Get.find<SkillsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (con.mobileSkills.isNotEmpty)
              buildCategory("Mobile/Web Development", Icons.phone_android,
                  con.mobileSkills),
            if (con.programmingSkills.isNotEmpty)
              buildCategory(
                  "Programming Languages", Icons.code, con.programmingSkills),
            if (con.databaseSkills.isNotEmpty)
              buildCategory(
                  "Database Management", Icons.storage, con.databaseSkills),
          ],
        ),
      );
    });
  }

  Widget buildCategory(
      String title, IconData icon, List<Map<String, dynamic>> skills) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.tealAccent, size: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                final skill = skills[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.tealAccent.withOpacity(0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.tealAccent.withOpacity(0.2),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(skill['icon'], size: 24, color: Colors.tealAccent),
                      const SizedBox(height: 4),
                      Text(
                        skill['name'] ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
