class TopupMonthMethod {
  final String month;
  final String topupMethod;
  final int totalTopups;
  final double totalAmount;

  TopupMonthMethod({
    required this.month,
    required this.topupMethod,
    required this.totalTopups,
    required this.totalAmount,
  });

  factory TopupMonthMethod.fromJson(Map<String, dynamic> json) {
    return TopupMonthMethod(
      month: json['month'],
      topupMethod: json['topup_method'],
      totalTopups: json['total_topups'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'topup_method': topupMethod,
      'total_topups': totalTopups,
      'total_amount': totalAmount,
    };
  }
}
