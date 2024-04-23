import 'dart:convert';

// ! TODO: handle null for map conversions
class StudentLoan {
  final String accountID;
  final String accountNumber;
  String? name;
  final double lastPaymentAmount;
  final DateTime lastPaymentDate;
  final double lastStatementBalance;
  final DateTime lastStatementIssueDate;
  final double minimumPaymentAmount;
  final DateTime nextPaymentDueDate;
  final DateTime originationDate;
  final double originationPrincipalAmount;
  final double outstandingInterestAmount;
  final int paymentReferenceNumber;
  final double ytdInterestPaid;
  final double ytdPrincipalPaid;

  StudentLoan(
      {required this.accountID,
      required this.accountNumber,
      this.name,
      required this.lastPaymentAmount,
      required this.lastPaymentDate,
      required this.lastStatementBalance,
      required this.lastStatementIssueDate,
      required this.minimumPaymentAmount,
      required this.nextPaymentDueDate,
      required this.originationDate,
      required this.originationPrincipalAmount,
      required this.outstandingInterestAmount,
      required this.paymentReferenceNumber,
      required this.ytdInterestPaid,
      required this.ytdPrincipalPaid});

  Map<String, dynamic> toMap() => {
        'account_id': accountID,
        'account_number': accountNumber,
        'name': name,
        'last_payment_amount': lastPaymentAmount,
        'last_payment_date': lastPaymentDate.millisecondsSinceEpoch,
        'last_statement_balance': lastStatementBalance,
        'last_statement_issue_date': lastStatementIssueDate.millisecondsSinceEpoch,
        'minimum_payment_amount': minimumPaymentAmount,
        'next_payment_due_date': nextPaymentDueDate.millisecondsSinceEpoch,
        'origination_date': originationDate.millisecondsSinceEpoch,
        'origination_principal_amount': originationPrincipalAmount,
        'outstanding_interest_amount': outstandingInterestAmount,
        'payment_reference_number': paymentReferenceNumber,
        'ytd_interest_paid': ytdInterestPaid,
        'ytd_principal_paid': ytdPrincipalPaid,
      };

  factory StudentLoan.fromJSON(Map<String, dynamic> json) => StudentLoan(
        accountID: json['account_id'] ?? '',
        accountNumber: json['account_number'] ?? '',
        name: json['name'],
        lastPaymentAmount: json['last_payment_amount']?.toDouble() ?? 0.0,
        lastPaymentDate: DateTime.parse(json['last_payment_date']),
        lastStatementBalance: json['last_statement_balance']?.toDouble() ?? 0.0,
        lastStatementIssueDate: DateTime.parse(json['last_statement_issue_date']),
        minimumPaymentAmount: json['minimum_payment_amount']?.toDouble() ?? 0.0,
        nextPaymentDueDate: DateTime.parse(json['next_payment_due_date']),
        originationDate: DateTime.parse(json['origination_date']),
        originationPrincipalAmount: json['origination_principal_amount']?.toDouble() ?? 0.0,
        outstandingInterestAmount: json['outstanding_interest_amount']?.toDouble() ?? 0.0,
        paymentReferenceNumber: int.parse(json['payment_reference_number'] ?? '0'),
        ytdInterestPaid: json['ytd_interest_paid']?.toDouble() ?? 0.0,
        ytdPrincipalPaid: json['ytd_principal_paid']?.toDouble() ?? 0.0,
      );

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'StudentLoan(accountID: $accountID, accountNumber: $accountNumber, name: $name, lastPaymentAmount: $lastPaymentAmount, lastPaymentDate: $lastPaymentDate, lastStatementBalance: $lastStatementBalance, lastStatementIssueDate: $lastStatementIssueDate, minimumPaymentAmount: $minimumPaymentAmount, nextPaymentDueDate: $nextPaymentDueDate, originationDate: $originationDate, originationPrincipalAmount: $originationPrincipalAmount, outstandingInterestAmount: $outstandingInterestAmount, paymentReferenceNumber: $paymentReferenceNumber, ytdInterestPaid: $ytdInterestPaid, ytdPrincipalPaid: $ytdPrincipalPaid)';
  }
}
