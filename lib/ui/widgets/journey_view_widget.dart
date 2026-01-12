import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oliftrop/controller/journey_controller.dart';

class JourneyViewWidget extends StatelessWidget {
  JourneyViewWidget({super.key});

  final JourneyController con = Get.find<JourneyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: con.experiences
              .asMap()
              .entries
              .map((entry) => timelineCard(
                    entry.key,
                    entry.value,
                    con.experiences.length,
                  ))
              .toList(),
        ),
      );
    });
  }
}

Widget timelineCard(int index, Map<String, dynamic> experience, int total) {
  final iconName = experience["icon"] ?? "work";

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IntrinsicHeight(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: Colors.tealAccent.withOpacity(0.15),
              radius: 14,
              child: Icon(
                getIconFromString(iconName),
                color: Colors.tealAccent,
                size: 16,
              ),
            ),
            if (index < total - 1)
              Container(
                width: 2,
                height: 30,
                color: Colors.tealAccent.withOpacity(0.3),
              ),
          ],
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.tealAccent.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience["role"] ?? "",
                style: const TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                experience["company"] ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      color: Colors.tealAccent, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    experience["duration"] ?? "",
                    style: TextStyle(
                      color: Colors.tealAccent.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...(experience["tasks"] as List<dynamic>? ?? []).map((task) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.circle,
                          size: 6, color: Colors.tealAccent),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          task.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: (experience["skills"] as List<dynamic>? ?? [])
                    .map<Widget>((skill) => skillTag(skill.toString()))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget skillTag(String skill) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.tealAccent.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.tealAccent.withOpacity(0.4)),
    ),
    child: Text(skill,
        style: const TextStyle(color: Colors.tealAccent, fontSize: 10)),
  );
}

IconData getIconFromString(String iconName) {
  switch (iconName) {
    case 'business':
      return Icons.business;
    case 'computer':
      return Icons.computer;
    case 'electric_car':
      return Icons.electric_car;
    case 'calendar':
      return Icons.calendar_today;
    default:
      return Icons.work;
  }
}
