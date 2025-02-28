class TopupMonthAmount {
  final String month;
  final double totalAmount;

  TopupMonthAmount({
    required this.month,
    required this.totalAmount,
  });

  factory TopupMonthAmount.fromJson(Map<String, dynamic> json) {
    return TopupMonthAmount(
      month: json['month'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'total_amount': totalAmount,
    };
  }
}
