class Task {
  String _id;
  bool _isChecked;
  String _name;

  String get id => _id;
  bool get isChecked => _isChecked;
  String get name => _name;

  Task(this._id, this._isChecked, this._name);

  void check() {
    _isChecked = true;
  }

  void uncheck() {
    _isChecked = false;
  }
}
