class TransactionYearlyAmount {
  final String year;
  final double totalAmount;

  TransactionYearlyAmount({
    required this.year,
    required this.totalAmount,
  });

  factory TransactionYearlyAmount.fromJson(Map<String, dynamic> json) {
    return TransactionYearlyAmount(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
    };
  }
}
