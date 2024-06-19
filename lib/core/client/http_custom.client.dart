import 'package:http/http.dart' as http;
import 'dart:convert';
import '../storage/token.storage.dart';


class HttpClient {
  final TokenStorage tokenStorage = TokenStorage();

  Future<http.Response> post(Uri url, {Map<String, String>? headers, dynamic body}) async {
    String? token = await tokenStorage.getToken();
    headers ??= {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    headers['Content-Type'] = 'application/json';
    return http.post(url, headers: headers, body: jsonEncode(body));
  }

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    String? token = await tokenStorage.getToken();
    headers ??= {};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return http.post(Uri.parse(url), headers: headers);
  }
}
