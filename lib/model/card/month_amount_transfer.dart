class CardMonthTransferAmount {
  final String month;
  final double totalAmount;

  CardMonthTransferAmount({required this.month, required this.totalAmount});

  factory CardMonthTransferAmount.fromJson(Map<String, dynamic> json) {
    return CardMonthTransferAmount(
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
