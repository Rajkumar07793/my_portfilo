import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class JourneyController extends GetxController {
  final RxList<Map<String, dynamic>> experiences = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchExperiencesFromRemoteConfig();
  }

  void fetchExperiencesFromRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));

      await remoteConfig.fetchAndActivate();

      final dataString = remoteConfig.getString('experience_data');

      if (dataString.isNotEmpty) {
        final List<dynamic> data = jsonDecode(dataString);
        experiences.value = data
            .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
            .toList();
      }
    } catch (e) {
      print("Error loading experience data from Remote Config: $e");
    }
  }
}
