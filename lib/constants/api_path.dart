class ApiPath {
  static const String baseUrl = "https://albertodos.github.io/victor/Api/"; // Homolog
  static const String baseUrlMicro = "http://34.237.194.128/api/";
  static const String baseUrlCMS = "http://52.207.14.237:1337/api/"; // Homolog
  static const String imgBaseUrl = "https://albertodos.github.io/victor/";
  static const String baseUrlImgCMS = "http://52.207.14.237:1337";
  static const String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJPM2luNVhHaG5Ja000Ul91S09NdktJdkJ0VFNPX1RGUVdsSXdzNnROa3ZVIn0.eyJleHAiOjE2NjgwODA5NzEsImlhdCI6MTY2ODA3OTE3MSwianRpIjoiY2E3ZmZiNGQtOTk3Ny00ZWU3LWI4ZmQtOWEzMzJkZDc1ODg4IiwiaXNzIjoiaHR0cDovLzUyLjYuMjA4LjEwNC9yZWFsbXMvbWFzdGVyIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImJmZTUxYzFlLTVmNzktNDVkMS04N2M4LTM1NDFiZTJkOWEyYyIsInR5cCI6IkJlYXJlciIsImF6cCI6InRhcHAtdHJhZGluZyIsInNlc3Npb25fc3RhdGUiOiJjNTM1NjY3MC1mYTZlLTRiMDYtOWE5MC1jNmYyODA4NjBhZDgiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImRlZmF1bHQtcm9sZXMtbWFzdGVyIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiYWRkcmVzcyBlbWFpbCBwcm9maWxlIiwic2lkIjoiYzUzNTY2NzAtZmE2ZS00YjA2LTlhOTAtYzZmMjgwODYwYWQ4IiwiYWRkcmVzcyI6e30sImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiTGlsaWFubyBFbm9xdWUgZGEgVmVpZ2EgVGF2YXJlcyIsInByZWZlcnJlZF91c2VybmFtZSI6ImxpbGlhbm9AdGFwcGVuZ2luZS5jb20iLCJnaXZlbl9uYW1lIjoiTGlsaWFubyBFbm9xdWUiLCJmYW1pbHlfbmFtZSI6ImRhIFZlaWdhIFRhdmFyZXMiLCJlbWFpbCI6ImxpbGlhbm9AdGFwcGVuZ2luZS5jb20ifQ.Ymqop2BigRHzJKUGMWzU-RgYm-bgqR3oTyT4nwdSCIJHQjyqNqf7KQH5II_qA9YhXy2iES-WbkOQdFdhLO0aLy3-fEVXtmmVNxRG7RI_KWU3yKBwaRm-UZvWu0LzFiBgGfcHqr6b-mnyiAwCXuQ3FdEkIW9VAwET5v_xHBLWis_Ibi5pp-ubU7PlOe8DYcrHaCLwEc2LSNyveVWM3-p7E0vdSBBqIOAk9_tOE0A7-vOGUuZ6wsbnXcb8Q8WyCAmFvI5hRyFd_pYoM_45hDm6bVyhzODwX7UvdTeXb3Ce_ShMZMyn93JVrRdfEap9bMEQuiQAbhwC6HsnR0iJ9KBZkw";

  static getBaseImageUrl(String url) {
    return url.startsWith("http") ? url : imgBaseUrl + url;
  }
}
