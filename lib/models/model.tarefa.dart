import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _isFinished = false;

  Tarefa(this._description, this._isFinished);

  String get id => _id;
  // ignore: unnecessary_getters_setters
  String get description => _description;
  // ignore: unnecessary_getters_setters
  bool get isFinished => _isFinished;

  set description(String value) {
    _description = value;
  }

  set isFinished(bool value) {
    _isFinished = value;
  }
}
