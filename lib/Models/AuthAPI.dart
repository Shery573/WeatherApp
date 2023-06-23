import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthAPI {
  Future<String> signIn(String email, String password) async {
    final String apiUrl = 'http://localhost:5000/auth/login';

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email.trim(), "password": password.trim()}),
    );

    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      return token;
    } else {
      if (response.body.isNotEmpty) {
        final String errorMessage =
            jsonDecode(response.body)['errors'][0]['msg'];
        return errorMessage;
      } else {
        return 'Error occurred with status code: ${response.statusCode}';
      }
    }
  }

  Future<String> signUp(String email, String password) async {
    final String apiUrl = 'http://localhost:5000/auth/signup';

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email.trim(), "password": password.trim()}),
    );

    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      return token;
    } else {
      if (response.body.isNotEmpty) {
        final String errorMessage =
            jsonDecode(response.body)['errors'][0]['msg'];
        return errorMessage;
      } else {
        return 'Error occurred with status code: ${response.statusCode}';
      }
    }
  }
}
