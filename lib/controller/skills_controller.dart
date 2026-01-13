import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsController extends GetxController {
  final RxList<Map<String, dynamic>> skillCategories =
      <Map<String, dynamic>>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSkillsFromRemoteConfig();
  }

  void fetchSkillsFromRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();

      final dataString =
          remoteConfig.getString('skills'); //skills_data used previously
      if (dataString.isNotEmpty) {
        final Map<String, dynamic> decoded = jsonDecode(dataString);

        List<Map<String, dynamic>> loadedCategories = [];

        decoded.forEach((key, value) {
          if (value is List) {
            loadedCategories.add({
              "title": key,
              "skills": parseSkills(value),
            });
          }
        });

        skillCategories.value = loadedCategories;
      }

      isLoading.value = false;
    } catch (e) {
      print("❌ Error fetching skills: $e");
    }
  }

  List<Map<String, dynamic>> parseSkills(List<dynamic> data) {
    return data.map<Map<String, dynamic>>((item) {
      return {"name": item["name"], "icon": getIconFromString(item["icon"])};
    }).toList();
  }

  IconData getIconFromString(String? iconName) {
    switch (iconName) {
      case "code":
        return Icons.code;
      case "android":
        return Icons.android;
      case "flutter_dash":
        return Icons.flutter_dash;
      case "cloud_download":
        return Icons.cloud_download;
      case "cloud":
        return Icons.cloud;
      case "storage":
        return Icons.storage;
      case "apple":
        return Icons.apple;
      case "settings":
        return Icons.settings;
      case "architecture":
        return Icons.architecture;
      case "api":
        return Icons.api;
      case "security":
        return Icons.security;
      case "build":
        return Icons.build;
      case "layers":
        return Icons.layers;
      case "payment":
        return Icons.payment;
      default:
        return Icons.device_unknown;
    }
  }
}
