class TopupYearlyAmount {
  final String year;
  final double totalAmount;

  TopupYearlyAmount({
    required this.year,
    required this.totalAmount,
  });

  factory TopupYearlyAmount.fromJson(Map<String, dynamic> json) {
    return TopupYearlyAmount(
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
