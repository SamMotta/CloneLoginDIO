// ignore_for_file: unnecessary_getters_setters

class TarefaSqliteModel {
  final int _id;
  String _description = "";
  bool _isCompleted = false;

  TarefaSqliteModel(this._id, this._description, this._isCompleted);

  int get id => _id;
  String get description => _description;
  bool get isCompleted => _isCompleted;

  set description(String value) {
    _description = value;
  }

  set isCompleted(bool value) {
    _isCompleted = value;
  }
}
