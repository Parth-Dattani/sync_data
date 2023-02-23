extension NullString on String? {
  String defaultStringValue({value = ""}) {
    return this ?? value;
  }
}
