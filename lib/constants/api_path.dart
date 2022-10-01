class ApiPath {
  static const String baseUrl = "https://api.teste8.com/"; // Homolog
  // static final String BASE_URL =  "http://api.buscamilhas.local/"; // Development
  // static final String BASE_URL =  "https://api.sistema.buscamilhas.com"; // Prodution

  static const String imgBaseUrl = "";
  static getBaseImageUrl(String url) {
    return url.startsWith("http") ? url : imgBaseUrl + url;
  }
}
