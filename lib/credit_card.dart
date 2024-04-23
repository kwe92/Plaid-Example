import 'dart:convert';

// ! TODO: handle null for map conversions

class CreditCard {
  final String accountID;
  String? name;
  final bool isOverDue;
  final double lastPaymentAmount;
  final DateTime lastPaymentDate;
  final double lastStatementBalance;
  final DateTime lastStatementIssueDate;
  final double minimumPaymentAmount;
  final DateTime nextPaymentDueDate;

  CreditCard({
    required this.accountID,
    this.name,
    required this.isOverDue,
    required this.lastPaymentAmount,
    required this.lastPaymentDate,
    required this.lastStatementBalance,
    required this.lastStatementIssueDate,
    required this.minimumPaymentAmount,
    required this.nextPaymentDueDate,
  });

  Map<String, dynamic> toMap() => {
        'account_id': accountID,
        'name': name,
        'is_overdue': isOverDue,
        'last_payment_amount': lastPaymentAmount,
        'last_payment_date': lastPaymentDate.millisecondsSinceEpoch,
        'last_statement_balance': lastStatementBalance,
        'last_statement_issue_date': lastStatementIssueDate.millisecondsSinceEpoch,
        'minimum_payment_amount': minimumPaymentAmount,
        'next_payment_due_date': nextPaymentDueDate.millisecondsSinceEpoch,
      };

  factory CreditCard.fromJSON(Map<String, dynamic> map) => CreditCard(
        accountID: map['account_id'] ?? '',
        name: map['name'],
        isOverDue: map['is_overdue'] ?? false,
        lastPaymentAmount: map['last_payment_amount']?.toDouble() ?? 0.0,
        lastPaymentDate: DateTime.parse(map['last_payment_date']),
        lastStatementBalance: map['last_statement_balance']?.toDouble() ?? 0.0,
        lastStatementIssueDate: DateTime.parse(map['last_statement_issue_date']),
        minimumPaymentAmount: map['minimum_payment_amount']?.toDouble() ?? 0.0,
        nextPaymentDueDate: DateTime.parse(map['next_payment_due_date']),
      );

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CreditCard(accountID: $accountID, name: $name, isOverDue: $isOverDue, lastPaymentAmount: $lastPaymentAmount, lastPaymentDate: $lastPaymentDate, lastStatementBalance: $lastStatementBalance, lastStatementIssueDate: $lastStatementIssueDate, minimumPaymentAmount: $minimumPaymentAmount, nextPaymentDueDate: $nextPaymentDueDate)';
  }
}
