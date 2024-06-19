import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taller_final/core/client/http_custom.client.dart';
import 'package:taller_final/core/storage/token.storage.dart';


class AuthService {
  final String apiUrl = "https://stslab.qhanati.com/websda/api";
  final TokenStorage tokenStorage = TokenStorage();
  final HttpClient httpClient = HttpClient();

  Future<bool> login(String email, String password) async {
    var url = Uri.parse('$apiUrl/appuser/login');
    
    var body = jsonEncode({
      'Email': email,
      'Password': password
    });
    var headers = {
      'Content-Type': 'application/json',
    };
    var result = await http.post(url, headers: headers, body: body);
    if (result.statusCode == 200) {
      String token = result.body;
      String cleanedToken = token.replaceAll('"', '');
      tokenStorage.saveToken(cleanedToken);
      return true;
    } else {
      throw Exception('Login failed');
    }
  }

  Future<void> register(String username, String email, String password) async {
    var url = Uri.parse('$apiUrl/appuser/register');
    var body = jsonEncode({
      "UserName": username,
      "Email": email,
      "Password": password
      });
      var headers = {
      'Content-Type': 'application/json',
    };
    var result = await http.post(url, headers: headers, body: body);
    if (result.statusCode != 200) {
      throw Exception('Register failed');
    }
  }
}
