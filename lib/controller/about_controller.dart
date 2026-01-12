import 'package:firebase_remote_config/firebase_remote_config.dart';

class AboutController {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setDefaults({
      'passionate_text': 'Default about text',
      'cv_url':
          'https://drive.google.com/file/d/1dE0n7WbQHZ085O5bwzihNiI0QjqsTONh/view?usp=sharing',
    });
    await _remoteConfig.fetchAndActivate();
  }

  String getPassionateText() {
    return _remoteConfig.getString('passionate_text');
  }

  String getCVUrl() {
    return _remoteConfig.getString('cv_url');
  }
}
