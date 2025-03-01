class CardMonthTopupAmount {
  final String month;
  final double totalAmount;

  CardMonthTopupAmount({required this.month, required this.totalAmount});

  factory CardMonthTopupAmount.fromJson(Map<String, dynamic> json) {
    return CardMonthTopupAmount(
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
