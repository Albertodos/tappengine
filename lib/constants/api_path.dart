class ApiPath {
  static const String baseUrl = "https://drive.google.com/uc?export=download&id="; // Homolog

  static const String imgBaseUrl = "https://drive.google.com/uc?export=download&id=";
  static getBaseImageUrl(String url) {
    return url.startsWith("http") ? url : imgBaseUrl + url;
  }
}
