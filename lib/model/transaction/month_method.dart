class TransactionMonthMethod {
  final String month;
  final String paymentMethod;
  final int totalTransactions;
  final double totalAmount;

  TransactionMonthMethod({
    required this.month,
    required this.paymentMethod,
    required this.totalTransactions,
    required this.totalAmount,
  });

  factory TransactionMonthMethod.fromJson(Map<String, dynamic> json) {
    return TransactionMonthMethod(
      month: json['month'],
      paymentMethod: json['payment_method'],
      totalTransactions: json['total_transactions'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'payment_method': paymentMethod,
      'total_transactions': totalTransactions,
      'total_amount': totalAmount,
    };
  }
}
