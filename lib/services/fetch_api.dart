import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String _baseUrl = dotenv.env['urlTM'] ?? '';
  final String _apiKey = dotenv.env['apiKey'] ?? '';

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      // Ajouter l'API key aux paramètres de la requête
      var queryParameters = {'apikey': _apiKey};
      if (params != null) {
        queryParameters.addAll(
            params.map((key, value) => MapEntry(key, value.toString())));
      }

      // Construire l'URL avec les paramètres
      var uri = Uri.parse('$_baseUrl$endpoint')
          .replace(queryParameters: queryParameters);

      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
