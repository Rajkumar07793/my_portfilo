import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:oliftrop/controller/projects_controller.dart';

class ProjectViewWidget extends StatelessWidget {
  final ProjectController controller = Get.find<ProjectController>();

  ProjectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: controller.projects
            .asMap()
            .entries
            .map(
              (e) => ContainerWidget(
                image: e.value.banner,
                title: e.value.title,
                description: e.value.description,
                alternateLayout: e.key.isOdd,
              ),
            )
            .toList(),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String? description;
  final String? title;
  final String? image;
  final bool alternateLayout;

  const ContainerWidget({
    super.key,
    this.description,
    this.image,
    this.title,
    this.alternateLayout = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.tealAccent.withOpacity(0.2),
            border: Border.all(
              color: Colors.tealAccent,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildImageSection(),
                    const SizedBox(height: 16),
                    buildTextSection(context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: alternateLayout
                      ? [
                          Expanded(child: buildTextSection(context)),
                          const SizedBox(width: 20),
                          Expanded(child: buildImageSection()),
                        ]
                      : [
                          Expanded(child: buildImageSection()),
                          const SizedBox(width: 20),
                          Expanded(child: buildTextSection(context)),
                        ],
                ),
        );
      },
    );
  }

  Widget buildImageSection() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 250,
        maxWidth: 350,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: image != null
            ? Image.asset(
                image!,
                fit: BoxFit.contain,
              )
            : const SizedBox(),
      ),
    );
  }

  Widget buildTextSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            label: Text(
              title ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.grey[800],
            labelStyle: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            description ?? "",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
