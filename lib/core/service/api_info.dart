abstract class APIInfo {
  final String baseUrl;

  APIInfo(this.baseUrl);

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  });

  Map<String, String> getHeaders();
}
