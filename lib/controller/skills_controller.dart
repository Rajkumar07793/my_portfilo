import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class SkillsController extends GetxController {
  final RxList<Map<String, dynamic>> mobileSkills =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> programmingSkills =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> databaseSkills =
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

      final dataString = remoteConfig.getString('skills_data');
      final Map<String, dynamic> decoded = jsonDecode(dataString);

      mobileSkills.value = parseSkills(decoded['mobileSkills']);
      programmingSkills.value = parseSkills(decoded['programmingSkills']);
      databaseSkills.value = parseSkills(decoded['databaseSkills']);
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
      default:
        return Icons.device_unknown;
    }
  }
}
