import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oliftrop/controller/about_controller.dart';
import 'package:oliftrop/controller/journey_controller.dart';
import 'package:oliftrop/controller/projects_controller.dart';
import 'package:oliftrop/controller/skills_controller.dart';
import 'package:oliftrop/ui/screens/desk_top_layout.dart';
import 'package:oliftrop/ui/screens/mobile_layout.dart';

class MainFragment extends StatefulWidget {
  const MainFragment({super.key});

  @override
  State<MainFragment> createState() => _MainFragmentState();
}

class _MainFragmentState extends State<MainFragment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTopSnackBar(context, "Try This Page On Mobile View 💡");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const DesktopLayout();
          } else {
            return const MobileLayout();
          }
        },
      ),
    );
  }

  void showTopSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 800,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }
}
