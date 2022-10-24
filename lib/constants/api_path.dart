class ApiPath {
  static const String baseUrl = "https://albertodos.github.io/victor/Api/"; // Homolog
  static const String baseUrlMicro = "http://34.237.194.128/api/"; // Homolog
  static const String imgBaseUrl = "https://albertodos.github.io/victor/";
  static getBaseImageUrl(String url) {
    return url.startsWith("http") ? url : imgBaseUrl + url;
  }
}
