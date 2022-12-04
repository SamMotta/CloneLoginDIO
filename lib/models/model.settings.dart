// ignore_for_file: unnecessary_getters_setters

class SettingsModel {
  late String _username;
  late double _height;
  late bool _pushNotifications;
  late bool _lightTheme;

  SettingsModel.empty() {
    _username = "";
    _height = 0.0;
    _pushNotifications = false;
    _lightTheme = false;
  }

  SettingsModel(
    this._username,
    this._height,
    this._pushNotifications,
    this._lightTheme,
  );

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  bool get pushNotifications => _pushNotifications;

  set pushNotifications(bool value) {
    _pushNotifications = value;
  }

  bool get lightTheme => _lightTheme;

  set lightTheme(bool value) {
    _lightTheme = value;
  }
}
