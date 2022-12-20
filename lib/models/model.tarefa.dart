// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _isFinished = false;

  Tarefa(this._description, this._isFinished);

  String get id => _id;
  String get description => _description;
  bool get isFinished => _isFinished;

  set description(String value) {
    _description = value;
  }

  set isFinished(bool value) {
    _isFinished = value;
  }
}
