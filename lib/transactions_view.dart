import 'package:flutter/material.dart';
import 'package:plaid_example/transaction.dart';
import 'package:plaid_example/transaction_tile.dart';

class TransactionsView extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsView({
    required this.transactions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transactions"),
        ),
        body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return TransactionListTile(transaction: transactions[index]);
          },
        )
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //     child: Text(
        //       transactions.toString(),
        //       style: const TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
