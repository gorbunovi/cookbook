import 'dart:convert';

import 'package:cookbook/core/logging/app_logger.dart';
import 'package:http/http.dart' as http;


class RestService {
  final http.Client client;

  RestService({required this.client});

  Future<dynamic> get(String url) async {
    Uri uri = Uri.parse(url);
    AppLogger.i('GET REQUEST: $uri');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // JSON → Map/List
    } else {
      throw Exception('Ошибка сети');
    }
  }
}