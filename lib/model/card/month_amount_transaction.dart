class CardMonthTransactionAmount {
  final String month;
  final double totalAmount;

  CardMonthTransactionAmount({required this.month, required this.totalAmount});

  factory CardMonthTransactionAmount.fromJson(Map<String, dynamic> json) {
    return CardMonthTransactionAmount(
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
