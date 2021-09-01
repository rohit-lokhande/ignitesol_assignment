abstract class ApiEndPoint {
  static String get baseUrl => 'http://skunkworks.ignitesol.com:8000/';

  static String getBookBySearch(String data) {
    return '${baseUrl}books/?search=$data';
  }
}
