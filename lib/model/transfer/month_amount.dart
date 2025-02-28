class TransferMonthAmount {
  final String month;
  final double totalAmount;

  TransferMonthAmount({
    required this.month,
    required this.totalAmount,
  });

  factory TransferMonthAmount.fromJson(Map<String, dynamic> json) {
    return TransferMonthAmount(
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
