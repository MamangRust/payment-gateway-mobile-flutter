class WithdrawMonthlyAmount {
  final String month;
  final double totalAmount;

  WithdrawMonthlyAmount({
    required this.month,
    required this.totalAmount,
  });

  factory WithdrawMonthlyAmount.fromJson(Map<String, dynamic> json) {
    return WithdrawMonthlyAmount(
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
