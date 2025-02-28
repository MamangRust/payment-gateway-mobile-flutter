class TopupYearStatusFailed {
  final String year;
  final double totalAmount;
  final int totalFailed;

  TopupYearStatusFailed({
    required this.year,
    required this.totalAmount,
    required this.totalFailed,
  });

  factory TopupYearStatusFailed.fromJson(Map<String, dynamic> json) {
    return TopupYearStatusFailed(
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
