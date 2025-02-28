class TransactionYearStatusFailed {
  final String year;
  final double totalAmount;
  final int totalFailed;

  TransactionYearStatusFailed({
    required this.year,
    required this.totalAmount,
    required this.totalFailed,
  });

  factory TransactionYearStatusFailed.fromJson(Map<String, dynamic> json) {
    return TransactionYearStatusFailed(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalFailed: json['total_failed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
      'total_failed': totalFailed,
    };
  }
}
