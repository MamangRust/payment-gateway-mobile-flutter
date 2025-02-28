class TransactionYearMethod {
  final String year;
  final String paymentMethod;
  final int totalTransactions;
  final double totalAmount;

  TransactionYearMethod({
    required this.year,
    required this.paymentMethod,
    required this.totalTransactions,
    required this.totalAmount,
  });

  factory TransactionYearMethod.fromJson(Map<String, dynamic> json) {
    return TransactionYearMethod(
      year: json['year'],
      paymentMethod: json['payment_method'],
      totalTransactions: json['total_transactions'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'payment_method': paymentMethod,
      'total_transactions': totalTransactions,
      'total_amount': totalAmount,
    };
  }
}
