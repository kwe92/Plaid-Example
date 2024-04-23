import "package:flutter/material.dart";
import "package:plaid_example/acount_view.dart";
import "package:plaid_example/connect_account_view_model.dart";
import "package:plaid_example/transactions_view.dart";
import "package:plaid_flutter/plaid_flutter.dart";
import "package:provider/provider.dart";

class ConnectAccountView extends StatelessWidget {
  const ConnectAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<ConnectAccountViewModel>(
      create: (context) => ConnectAccountViewModel(),
      builder: (context, _) {
        final model = context.watch<ConnectAccountViewModel>();

        return Scaffold(
          body: Container(
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    model.configuration?.toJson().toString() ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: model.createLinkTokenConfiguration,
                  child: const Text("Create Link Token Configuration"),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: model.configuration != null ? () => PlaidLink.open(configuration: model.configuration!) : null,
                  child: const Text("Open"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final accountInfo = await model.getAccountInformation();
                    // TODO: navigate to the account view screen
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AccountView(accountInfo: accountInfo),
                      ),
                    );
                  },
                  child: const Text("Get Account Data"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final transactions = await model.getTransactionsv2();
                    // TODO: navigate to the account view screen
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionsView(transactions: transactions),
                      ),
                    );
                  },
                  child: const Text("Transactions"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final liabilities = await model.getLiabilities();
                    // TODO: navigate to the disbursements view screen
                  },
                  child: const Text("Liabilities"),
                ),

                // Expanded(
                //   child: Center(
                //     child: Text(
                //       model.successObject?.toJson().toString() ?? "",
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
