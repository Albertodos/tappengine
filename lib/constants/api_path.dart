class ApiPath {
  static const String baseUrl = "https://albertodos.github.io/victor/Api/"; // Homolog
  static const String baseUrlMicro = "http://34.237.194.128/api/";
  static const String baseUrlCMS = "http://52.207.14.237:1337/api/"; // Homolog
  static const String imgBaseUrl = "https://albertodos.github.io/victor/";
  static const String baseUrlImgCMS = "http://52.207.14.237:1337";
  static const String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJPM2luNVhHaG5Ja000Ul91S09NdktJdkJ0VFNPX1RGUVdsSXdzNnROa3ZVIn0.eyJleHAiOjE2Njc3NzYxOTcsImlhdCI6MTY2Nzc3NDM5NywianRpIjoiNjlmMjk0MGYtMzA1ZC00MTk1LWI4NzEtNjVkNTdiYjBiZmFmIiwiaXNzIjoiaHR0cDovLzUyLjYuMjA4LjEwNC9yZWFsbXMvbWFzdGVyIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImJmZTUxYzFlLTVmNzktNDVkMS04N2M4LTM1NDFiZTJkOWEyYyIsInR5cCI6IkJlYXJlciIsImF6cCI6InRhcHAtdHJhZGluZyIsInNlc3Npb25fc3RhdGUiOiI1MDllYjcwYy04YmRiLTRhMjQtOTZjYi01ZjViZjQwODRlNDEiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImRlZmF1bHQtcm9sZXMtbWFzdGVyIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiYWRkcmVzcyBlbWFpbCBwcm9maWxlIiwic2lkIjoiNTA5ZWI3MGMtOGJkYi00YTI0LTk2Y2ItNWY1YmY0MDg0ZTQxIiwiYWRkcmVzcyI6e30sImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiTGlsaWFubyBFbm9xdWUgZGEgVmVpZ2EgVGF2YXJlcyIsInByZWZlcnJlZF91c2VybmFtZSI6ImxpbGlhbm9AdGFwcGVuZ2luZS5jb20iLCJnaXZlbl9uYW1lIjoiTGlsaWFubyBFbm9xdWUiLCJmYW1pbHlfbmFtZSI6ImRhIFZlaWdhIFRhdmFyZXMiLCJlbWFpbCI6ImxpbGlhbm9AdGFwcGVuZ2luZS5jb20ifQ.AuHytRpEMmwxSd5bG01IlLPoYMzne8iXL-_Fag3yEJnTPSS-hrpktqbhQ-I2e0gS3tD1qdLq0_Oi7BiJ0kdeFwOSvHfmE4hE7epp6bujPOtedyROYylVPBZqI98TWXytCfZCR_cM1YGfRAauqhN6EX-lnIG3-K8ImIDKiHomjlzzY4wolObTmUiRNnO6zjMsG0KmzWOq03LkWR3Z6K8wzoh3tucmXBIX4bP5S22Ajj8DyYKTWha1KBhzZIglPGP7zu-d7rK4jtjF_OczqWkp6e68EaW8tMxSlbGW3dZf-oIKMmDUjDIyB7k5S1wBXcK78sCoskmiCGfO4v-dQlXSfg";

  static getBaseImageUrl(String url) {
    return url.startsWith("http") ? url : imgBaseUrl + url;
  }
}
