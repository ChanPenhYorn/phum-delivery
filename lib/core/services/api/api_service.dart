// lib/core/services/api_client.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phum_delivery/core/utils/app_logger.dart';

class ApiClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiClient({
    required this.baseUrl,
    this.defaultHeaders = const {
      "Content-Type": "application/json",
    },
  });

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: {...defaultHeaders, ...?headers},
    );

    AppLogger.log("ROUTE REQUEST $baseUrl$endpoint");
    AppLogger.log("HEADERS REQUEST $headers");
    AppLogger.log("STATUS CODE ${response.statusCode}");

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {...defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );

    AppLogger.log("ROUTE REQUEST $baseUrl$endpoint");
    AppLogger.log("BODY REQUEST $body");
    AppLogger.log("HEADERS REQUEST $headers");
    AppLogger.log("STATUS CODE ${response.statusCode}");
    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      // throw ("API Error: ${response.statusCode} - ${data["message"]}");
      return data;
    }
  }
}
