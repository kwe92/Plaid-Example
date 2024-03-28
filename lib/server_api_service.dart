import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final client = http.Client();

final serverApiService = ServerApiService();

class ServerApiService extends ChangeNotifier {
  final String _host = "http://127.0.0.1:8000";

  Future<void> exchangePublicTokenForAccessToken(String publicToken) async {
    final response = await client.post(
        Uri.parse(
          "$_host/api/set_access_token",
        ),
        body: jsonEncode({"public_token": publicToken}));

    final Map<String, dynamic> resonseBody = jsonDecode(response.body);

    debugPrint("\n\nfrom exchangePublicTokenForAccessToken:\n\n$resonseBody");
  }

  Future<Map<String, dynamic>> getAccountInformation() async {
    final response = await client.get(Uri.parse("$_host/api/auth"));

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    return responseBody;
  }
}
