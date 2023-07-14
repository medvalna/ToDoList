import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigRepository {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  ConfigRepository._();

  //ConfigRepository(this._remoteConfig);
  static ConfigRepository configRepository = ConfigRepository._();

  //ConfigRepository(this._remoteConfig);
  bool get useImportanceColor =>
      _remoteConfig.getBool(_ConfigFields.importanceColor);

  Future<void> init() async {
    _remoteConfig.setDefaults({
      _ConfigFields.importanceColor: false,
    });
    await _remoteConfig.fetchAndActivate();
  }
}

abstract class _ConfigFields {
  static const importanceColor = 'importanceColor';
}
