class TransferMonthStatusFailed {
  final String year;
  final String month;
  final double totalAmount;
  final int totalFailed;

  TransferMonthStatusFailed({
    required this.year,
    required this.month,
    required this.totalAmount,
    required this.totalFailed,
  });

  factory TransferMonthStatusFailed.fromJson(Map<String, dynamic> json) {
    return TransferMonthStatusFailed(
      year: json['year'],
      month: json['month'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalFailed: json['total_failed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'total_amount': totalAmount,
      'total_failed': totalFailed,
    };
  }
}
