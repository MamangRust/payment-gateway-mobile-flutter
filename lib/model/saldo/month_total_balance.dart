class SaldoMonthTotalBalance {
  final String month;
  final String year;
  final double totalBalance;

  SaldoMonthTotalBalance({
    required this.month,
    required this.year,
    required this.totalBalance,
  });

  factory SaldoMonthTotalBalance.fromJson(Map<String, dynamic> json) {
    return SaldoMonthTotalBalance(
      month: json['month'],
      year: json['year'],
      totalBalance: (json['total_balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'year': year,
      'total_balance': totalBalance,
    };
  }
}
