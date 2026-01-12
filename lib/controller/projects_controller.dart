import 'dart:convert';
import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:oliftrop/model/projects_model.dart';

class ProjectController extends GetxController {
  var projects = <ProjectsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ));

      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('project_data');

      final List<dynamic> decoded = jsonDecode(jsonString);
      projects.value = decoded.map((e) => ProjectsModel.fromJson(e)).toList();
    } catch (e) {
      print('Remote config fetch error: $e');
    }
  }
}
