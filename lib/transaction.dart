class Transaction {
  final String? transactionId;
  final String? merchantName;
  final double amount;
  final String? authorizedDate;

  double get remainder {
    final rem = double.parse(
      (1 - (amount - amount.floor())).toStringAsPrecision(2),
    );
    if (rem == 1) {
      return 0;
    }
    return rem;
  }

  double get total => double.parse((amount + remainder).toStringAsPrecision(2));

  const Transaction({
    required this.transactionId,
    required this.merchantName,
    required this.amount,
    required this.authorizedDate,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : transactionId = json["transaction_id"],
        merchantName = json["merchant_name"],
        amount = double.parse(json["amount"].toString()),
        authorizedDate = json["authorized_date"];

  Map<String, dynamic> toJson() {
    return {
      "transaction_id": transactionId,
      "merchant_name": merchantName,
      "amount": amount,
      "remainder": remainder,
      "total": total,
      "authorized_date": authorizedDate,
    };
  }

  @override
  String toString() {
    return 'Transaction(transactionId: $transactionId, merchantName: $merchantName, amount: $amount, remainder: $remainder, total: $total,authorizedDate: $authorizedDate)';
  }
}
