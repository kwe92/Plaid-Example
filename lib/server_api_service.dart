import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// TODO: Add Comments

// ! TODO: STILL NEEEDS ERROR HANDLING WHEN NETWORK SERVICE IS INTERUPTED OR DOWN

// ! TODO: try catch for when response bodies are null

// TODO: rename to something more meaningful

final client = http.Client();

final serverApiService = ServerApiService();

class ServerApiService extends ChangeNotifier {
  final String _host = "http://127.0.0.1:8000";

  Future<void> exchangePublicTokenForAccessToken(String publicToken) async {
    final response = await client.post(
      Uri.parse(
        "$_host/api/set_access_token",
      ),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(
        {"public_token": publicToken},
      ),
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    debugPrint("\n\nfrom exchangePublicTokenForAccessToken:\n\n$responseBody");
  }

  Future<Map<String, dynamic>> getAccountInformation() async {
    final response = await client.get(
      Uri.parse("$_host/api/auth"),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    return responseBody;
  }

  Future<String?> fetchLinkToken() async {
    final response = await client.post(
        Uri.parse(
          "$_host/api/create_link_token",
        ),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    final String? linkToken = responseBody["link_token"];

    debugPrint("\n\nfrom fetchLinkToken:\n\n$responseBody");

    return linkToken;
  }

  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final response = await client.get(Uri.parse("$_host/api/transactions"));

    final List<dynamic> responseBody = json.decode(response.body)["latest_transactions"];

    final List<Map<String, dynamic>> domainData = List.from(responseBody);

    return domainData;
  }

  Future<Map<String, dynamic>> fetchLiabilities() async {
    final response = await client.get(Uri.parse("$_host/api/liabilities"));

    final Map<String, dynamic> responseBody = json.decode(response.body)["liabilities"];

    return responseBody;
  }

  Future<List<Map<String, dynamic>>> fetchAccounts() async {
    final response = await client.get(Uri.parse("$_host/api/accounts"));

    final List<dynamic> responseBody = json.decode(response.body)["accounts"];

    final List<Map<String, dynamic>> domainData = List.from(responseBody);

    return domainData;
  }
}
