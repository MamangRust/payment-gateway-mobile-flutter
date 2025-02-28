class SaldoMonthBalance {
  final String month;
  final double totalBalance;

  SaldoMonthBalance({
    required this.month,
    required this.totalBalance,
  });

  factory SaldoMonthBalance.fromJson(Map<String, dynamic> json) {
    return SaldoMonthBalance(
      month: json['month'],
      totalBalance: (json['total_balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'total_balance': totalBalance,
    };
  }
}
