class Assets {
  static String getFullPath(String name) => "assets/images/$name";

  static String get adventure => getFullPath("adventure.png");

  static String get back => getFullPath("back.png");

  static String get cancel => getFullPath("cancel.png");

  static String get drama => getFullPath("drama.png");

  static String get fiction => getFullPath("fiction.png");

  static String get history => getFullPath("history.png");

  static String get humour => getFullPath("humour.png");

  static String get next => getFullPath("next.png");

  static String get pattern => getFullPath("pattern.png");

  static String get philosophy => getFullPath("philosophy.png");

  static String get politics => getFullPath("politics.png");

  static String get search => getFullPath("search.png");

  static String get bookPlaceholder => getFullPath("bookPlaceholder.png");
}
