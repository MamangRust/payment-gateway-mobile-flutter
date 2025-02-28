class TransactionMonthAmount {
  final String month;
  final double totalAmount;

  TransactionMonthAmount({
    required this.month,
    required this.totalAmount,
  });

  factory TransactionMonthAmount.fromJson(Map<String, dynamic> json) {
    return TransactionMonthAmount(
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
