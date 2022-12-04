import 'package:hive/hive.dart';
import 'package:trilhaapp/models/model.settings.dart';

class SettingsRepository {
  static late Box _box;

  SettingsRepository._load();

  static Future<SettingsRepository> load() async {
    if (Hive.isBoxOpen('settings')) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }

    return SettingsRepository._load();
  }

  void save(SettingsModel settingsModel) {
    _box.put('settingsModel', {
      'username': settingsModel.username,
      'height': settingsModel.height,
      'pushNotifications': settingsModel.pushNotifications,
      'theme': settingsModel.lightTheme,
    });
  }

  SettingsModel get() {
    var settings = _box.get('settingsModel');
    if (settings == null) {
      return SettingsModel.empty();
    }

    return SettingsModel(
      settings["username"],
      settings["height"],
      settings["pushNotifications"],
      settings["theme"],
    );
  }
}
