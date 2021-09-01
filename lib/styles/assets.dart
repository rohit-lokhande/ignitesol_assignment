class Assets {
  static String getFullPath(String name) => "assets/images/$name";

  static String get adventure => getFullPath("adventure.svg");

  static String get back => getFullPath("back.svg");

  static String get cancel => getFullPath("cancel.svg");

  static String get drama => getFullPath("drama.svg");

  static String get fiction => getFullPath("fiction.svg");

  static String get history => getFullPath("history.svg");

  static String get humour => getFullPath("humour.svg");

  static String get next => getFullPath("next.svg");

  static String get pattern => getFullPath("pattern.svg");

  static String get philosophy => getFullPath("philosophy.svg");

  static String get politics => getFullPath("politics.svg");

  static String get search => getFullPath("search.svg");

  static String get bookPlaceholder => getFullPath("bookPlaceholder.png");
}
