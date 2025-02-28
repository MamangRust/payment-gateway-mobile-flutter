class TopupYearlyMethod {
  final String year;
  final String topupMethod;
  final int totalTopups;
  final double totalAmount;

  TopupYearlyMethod({
    required this.year,
    required this.topupMethod,
    required this.totalTopups,
    required this.totalAmount,
  });

  factory TopupYearlyMethod.fromJson(Map<String, dynamic> json) {
    return TopupYearlyMethod(
      year: json['year'],
      topupMethod: json['topup_method'],
      totalTopups: json['total_topups'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'topup_method': topupMethod,
      'total_topups': totalTopups,
      'total_amount': totalAmount,
    };
  }
}
