class CardMonthBalance {
  final String month;
  final double totalBalance;

  CardMonthBalance({required this.month, required this.totalBalance});

  factory CardMonthBalance.fromJson(Map<String, dynamic> json) {
    return CardMonthBalance(
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
