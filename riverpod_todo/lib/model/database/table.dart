class Table<T> {
  String getCreateCommand() => "";
  T toEntity(Map<String, dynamic> map) => null;
  Map<String, dynamic> toMap(T item) => { "" : 0 };
}