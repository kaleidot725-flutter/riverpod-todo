class Task {
  Task(this._id, this._isChecked, this._name);

  String _id;
  String get id => _id;

  bool _isChecked;
  bool get isChecked => _isChecked;

  String _name;
  String get name => _name;

  void check() {
    _isChecked = true;
  }

  void uncheck() {
    _isChecked = false;
  }
}
