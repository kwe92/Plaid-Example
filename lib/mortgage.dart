import 'dart:convert';

// ! TODO: handle null for map conversions

class MortgageLoan {
  final String accountID;
  final String accountNumber;
  String? name;
  final double currentLateFee;
  final double escrowBalance;
  final bool hasPmi;
  final bool hasPrepaymentPenalty;
  final double lastPaymentAmount;
  final DateTime lastPaymentDate;
  final String loanTerm;
  final double nextMonthlyPayment;
  final DateTime nextPaymentDueDate;
  final double pastDueAmount;
  final double ytdInterestPaid;
  final double ytdPrincipalPaid;

  MortgageLoan({
    required this.accountID,
    required this.accountNumber,
    this.name,
    required this.currentLateFee,
    required this.escrowBalance,
    required this.hasPmi,
    required this.hasPrepaymentPenalty,
    required this.lastPaymentAmount,
    required this.lastPaymentDate,
    required this.loanTerm,
    required this.nextMonthlyPayment,
    required this.nextPaymentDueDate,
    required this.pastDueAmount,
    required this.ytdInterestPaid,
    required this.ytdPrincipalPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountID,
      'account_number': accountNumber,
      'name': name,
      'current_late_fee': currentLateFee,
      'escrow_balance': escrowBalance,
      'has_pmi': hasPmi,
      'has_prepayment_penalty': hasPrepaymentPenalty,
      'last_payment_amount': lastPaymentAmount,
      'last_payment_date': lastPaymentDate.millisecondsSinceEpoch,
      'loan_term': loanTerm,
      'next_monthly_payment': nextMonthlyPayment,
      'next_payment_due_date': nextPaymentDueDate.millisecondsSinceEpoch,
      'past_due_amount': pastDueAmount,
      'ytd_interest_paid': ytdInterestPaid,
      'ytd_principal_paid': ytdPrincipalPaid,
    };
  }

  factory MortgageLoan.fromJSON(Map<String, dynamic> map) => MortgageLoan(
        accountID: map['account_id'] ?? '',
        accountNumber: map['account_number'] ?? '',
        name: map['name'],
        currentLateFee: map['current_late_fee']?.toDouble() ?? 0.0,
        escrowBalance: map['escrow_balance']?.toDouble() ?? 0.0,
        hasPmi: map['has_pmi'] ?? false,
        hasPrepaymentPenalty: map['has_prepayment_penalty'] ?? false,
        lastPaymentAmount: map['last_payment_amount']?.toDouble() ?? 0.0,
        lastPaymentDate: DateTime.parse(map['last_payment_date']),
        loanTerm: map['loan_term'] ?? '',
        nextMonthlyPayment: map['next_monthly_payment']?.toDouble() ?? 0.0,
        nextPaymentDueDate: DateTime.parse(map['next_payment_due_date']),
        pastDueAmount: map['past_due_amount']?.toDouble() ?? 0.0,
        ytdInterestPaid: map['ytd_interest_paid']?.toDouble() ?? 0.0,
        ytdPrincipalPaid: map['ytd_principal_paid']?.toDouble() ?? 0.0,
      );

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Mortgage(accountID: $accountID, accountNumber: $accountNumber, name: $name, currentLateFee: $currentLateFee, escrowBalance: $escrowBalance, hasPmi: $hasPmi, hasPrepaymentPenalty: $hasPrepaymentPenalty, lastPaymentAmount: $lastPaymentAmount, lastPaymentDate: $lastPaymentDate, loanTerm: $loanTerm, nextMonthlyPayment: $nextMonthlyPayment, nextPaymentDueDate: $nextPaymentDueDate, pastDueAmount: $pastDueAmount, ytdInterestPaid: $ytdInterestPaid, ytdPrincipalPaid: $ytdPrincipalPaid)';
  }
}
