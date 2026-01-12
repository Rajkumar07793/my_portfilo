import 'package:firebase_remote_config/firebase_remote_config.dart';

class AboutController {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setDefaults({
      'passionate_text': 'Default about text',
      'cv_url':
          'https://firebasestorage.googleapis.com/v0/b/electronics-a101d.appspot.com/o/vaishanvi_cv.pdf?alt=media&token=8f344cd9-d859-4ef4-a47d-3fdb9509ba6e',
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
