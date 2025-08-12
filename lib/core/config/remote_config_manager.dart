import 'package:firebase_remote_config/firebase_remote_config.dart';


// Firebase üzerinden 8 saatte bir API_KEY elde etmek için
class RemoteConfigManager {
  static final FirebaseRemoteConfig _remoteConfig =
      FirebaseRemoteConfig.instance;
  static Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 8),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  static String get riotApiKey => _remoteConfig.getString('riot_api_key');
}
