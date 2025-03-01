class CardYearlyWithdrawAmount {
  final String year;
  final double totalAmount;

  CardYearlyWithdrawAmount({required this.year, required this.totalAmount});

  factory CardYearlyWithdrawAmount.fromJson(Map<String, dynamic> json) {
    return CardYearlyWithdrawAmount(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
    };
  }
}
