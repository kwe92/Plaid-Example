import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plaid_example/server_api_service.dart';
import 'package:plaid_example/transaction.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

class ConnectAccountViewModel extends ChangeNotifier {
  // TODO: remove eventCount | testing only
  int eventCount = 0;

  String _linkToken = "";

  LinkConfiguration? _configuration;
  StreamSubscription<LinkEvent>? _streamEvent;
  StreamSubscription<LinkExit>? _streamExit;
  StreamSubscription<LinkSuccess>? _streamSuccess;
  LinkObject? _successObject;

  LinkConfiguration? get configuration => _configuration;

  LinkObject? get successObject => _successObject;

  ConnectAccountViewModel() {
    initialize();
  }

  Future<void> initialize() async {
    _linkToken = await serverApiService.fetchLinkToken() ?? "";

    _streamEvent = PlaidLink.onEvent.listen(_onEvent);
    _streamExit = PlaidLink.onExit.listen(_onExit);
    _streamSuccess = PlaidLink.onSuccess.listen(_onSuccess);
  }

  setSuccessObject(LinkObject event) {
    _successObject = event;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getAccountInformation() async => await serverApiService.getAccountInformation();

  Future<List<Map<String, dynamic>>> getTransactions() async => await serverApiService.fetchTransactions();

  Future<List<Transaction>> getTransactionsv2() async {
    final transactionsMaps = await serverApiService.fetchTransactions();

    final List<Transaction> transactions = [for (var transaction in transactionsMaps) Transaction.fromJson(transaction)];

    return transactions;
  }

  void createLinkTokenConfiguration() {
    _configuration = LinkTokenConfiguration(
      token: _linkToken,
    );

    notifyListeners();
  }

  void _onEvent(LinkEvent event) {
    final name = event.name;

    final metadata = event.metadata.description();

    print("\n\nonEvent - $eventCount: $name, metadata: $metadata");
    // TODO: remove | testing only

    eventCount++;
  }

  Future<void> _onSuccess(LinkSuccess event) async {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("\n\nonSuccess: $token, metadata: $metadata");
    setSuccessObject(event);
    await serverApiService.exchangePublicTokenForAccessToken(token);
  }

  void _onExit(LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("\n\nonExit metadata: $metadata, error: $error");
  }
}
