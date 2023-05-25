import 'dart:convert';

import 'package:api_todo_auth/core/constant/api_string.dart';
import 'package:http/http.dart' as http;

class AuthService {


  final _client = http.Client();

  //POST request
  postData({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

}
